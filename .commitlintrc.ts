import type { UserConfig } from "@commitlint/types";
import { RuleConfigSeverity } from "@commitlint/types";

/**
 * Return all valid scopes
 * @returns A list of scope alternatives
 */
function scopes(): string[] {
	/**
	 * Get all directories in 'taxonomy' and return their
	 * names formated as scope.
	 */

	const fs = require("node:fs");

	const folderPath = "./Source";

	const scopes = fs
		.readdirSync(folderPath)
		.map((item: string) => {
			return item.toLowerCase();
		})
		.filter((item: string) => {
			/**
			 * Ignore:
			 *  - hidden files, like '.gitignore'
			 *  - Markdown documents, like 'README.md'
			 */
			return !(item.startsWith(".") || item.toLowerCase() == "readme.md");
		});

	return scopes;
}

const Configuration: UserConfig = {
	extends: ["@commitlint/config-conventional"],
	parserPreset: "conventional-changelog-atom",
	formatter: "@commitlint/format",
	rules: {
		/**
		 * Template:
		 *  {type}({scope): {subject}
		 *  {body}
		 *
		 */

		"header-max-length": [RuleConfigSeverity.Warning, "always", 72],
		"header-trim": [RuleConfigSeverity.Error, "always"],
		"header-full-stop": [RuleConfigSeverity.Error, "never", "."],

		"subject-empty": [RuleConfigSeverity.Warning, "never"],
		"subject-case": [RuleConfigSeverity.Error, "always", "sentence-case"],

		"scope-case": [RuleConfigSeverity.Error, "always", "lower-case"],
		"scope-enum": [RuleConfigSeverity.Error, "always", scopes()],

		"type-empty": [RuleConfigSeverity.Error, "never"],
		"type-enum": [
			RuleConfigSeverity.Error,
			"always",
			[
				"build",
				"ci",
				"security",
				"specification",
				"documentation",
				"feature",
				"fix",
				"performance",
				"refactory",
				"revert",
				"ui",
				"test",
			],
		],

		"body-full-stop": [RuleConfigSeverity.Error, "never", "."],

		"signed-off-by": [
			RuleConfigSeverity.Disabled,
			"always",
			"Signed-off-by:",
		],
	},
};

export default Configuration;
