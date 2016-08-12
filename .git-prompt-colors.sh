#!/usr/bin/env bash
# vim: set ts=2 sw=2 tw=0 ft=sh et :

override_git_prompt_colors() {
	GIT_PROMPT_THEME_NAME="Custom"

	GIT_PROMPT_START_USER="_LAST_COMMAND_INDICATOR_ ${ResetColor}"
	GIT_PROMPT_START_ROOT="${GIT_PROMPT_START_USER}"
  GIT_PROMPT_END_USER=" \n${BoldGreen}[${USER}@${HOSTNAME%%.*}${ResetColor}:${BoldBlue}${PathShort}]${ResetColor}$ "
  GIT_PROMPT_END_ROOT=" \n${BoldGreen}[${USER}@${HOSTNAME%%.*}${ResetColor}:${BoldBlue}${PathShort}]${ResetColor}# "

  # GIT_PROMPT_START_USER="_LAST_COMMAND_INDICATOR_ ${Yellow}${PathShort}${ResetColor}"
  # GIT_PROMPT_START_ROOT="_LAST_COMMAND_INDICATOR_ ${GIT_PROMPT_START_USER}"
  # GIT_PROMPT_END_USER=" \n${White}${Time12a}${ResetColor} $ "
  # GIT_PROMPT_END_ROOT=" \n${White}${Time12a}${ResetColor} # "
}


reload_git_prompt_colors "Custom"
