#!/bin/bash

# Cloudflare inspired theme
C_RESET='\033[0m'
C_GRAY='\033[38;5;245m'       # muted gray
C_ORANGE='\033[38;5;208m'     # Cloudflare orange
C_DARKORANGE='\033[38;5;166m' # deeper orange for emphasis
C_RED='\033[38;5;160m'        # danger/warning red

input=$(cat)

# Basic info
model=$(echo "$input" | jq -r '.model.display_name // .model.id // "claude"')
cwd=$(echo "$input" | jq -r '.cwd // empty')
dir=$(basename "$cwd" 2>/dev/null || echo "—")

# Very simplified git info
branch=""
git_hint=""
if [[ -n "$cwd" && -d "$cwd" ]]; then
    branch=$(git -C "$cwd" branch --show-current 2>/dev/null)
    if [[ -n "$branch" ]]; then
        # Minimal status: * = dirty, ↑ = ahead, ↓ = behind
        porcelain=$(git -C "$cwd" status --porcelain 2>/dev/null)
        if [[ -n "$porcelain" ]]; then
            git_hint="${C_RED}*${C_RESET}"
        fi
        
        ahead_behind=$(git -C "$cwd" rev-list --count --left-right @{upstream}...HEAD 2>/dev/null)
        if [[ -n "$ahead_behind" ]]; then
            ahead=$(echo "$ahead_behind" | cut -f2)
            behind=$(echo "$ahead_behind" | cut -f1)
            [[ "$ahead" -gt 0 ]] && git_hint+="${C_ORANGE}↑${C_RESET}"
            [[ "$behind" -gt 0 ]] && git_hint+="${C_DARKORANGE}↓${C_RESET}"
        fi
    fi
fi

# Context bar (simplified)
max_context=$(echo "$input" | jq -r '.context_window.context_window_size // 200000')
max_k=$((max_context / 1000))

transcript_path=$(echo "$input" | jq -r '.transcript_path // empty')

if [[ -n "$transcript_path" && -f "$transcript_path" ]]; then
    # Try to get real usage if available
    context_used=$(jq -s '
        map(select(.message.usage and .isSidechain != true and .isApiErrorMessage != true)) |
        last |
        if . then
            (.message.usage.input_tokens // 0) +
            (.message.usage.cache_read_input_tokens // 0) +
            (.message.usage.cache_creation_input_tokens // 0)
        else 20000 end
    ' < "$transcript_path")
else
    context_used=20000
fi

pct=$((context_used * 100 / max_context))
[[ $pct -gt 100 ]] && pct=100

bar=""
for ((i=0; i<10; i++)); do
    if [[ $((pct - i*10)) -ge 7 ]]; then
        bar+="${C_ORANGE}█${C_RESET}"
    elif [[ $((pct - i*10)) -ge 3 ]]; then
        bar+="${C_DARKORANGE}▓${C_RESET}"
    else
        bar+="${C_GRAY}░${C_RESET}"
    fi
done

# Final output line
output="${C_ORANGE}${model}${C_GRAY} | 📁 ${dir}"

if [[ -n "$branch" ]]; then
    output+=" | ${C_ORANGE}↯ ${branch}${git_hint}${C_GRAY}"
fi

output+=" | ${bar} ${C_GRAY}${pct}% / ${max_k}k${C_RESET}"

printf '%b\n' "$output"
