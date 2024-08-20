import type { UserConfig } from "@commitlint/types";
import { RuleConfigSeverity } from "@commitlint/types";

/**
 * Return all valid scopes
 * @returns A list of scope altennatives
 */
function scopes(): string[] {
	/**
	 * Get all directories in 'taxonomy' and return their
	 * names formated as scope.
	 */

	const fs = require("node:fs");

	const folderPath = "./Taxonomy";

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
			if (item.startsWith(".")) return false;

			if (item.endsWith(".md")) return false;

			return true;
		});

	return scopes;
}

const Configuration: UserConfig = {
	extends: ["@commitlint/config-conventional"],
	parserPreset: "conventional-changelog-atom",
	formatter: "@commitlint/format",
	rules: {
		"header-max-length": [RuleConfigSeverity.Warning, "always", 72],
		"header-trim": [RuleConfigSeverity.Error, "always"],
		"header-full-stop": [RuleConfigSeverity.Error, "never", "."],
		"signed-off-by": [
			RuleConfigSeverity.Warning,
			"always",
			"Signed-off-by:",
		],
		"body-full-stop": [RuleConfigSeverity.Error, "never", "."],
		"subject-empty": [RuleConfigSeverity.Warning, "always"],
		"subject-case": [RuleConfigSeverity.Error, "always", "sentence-case"],
		"scope-case": [RuleConfigSeverity.Error, "always", "sentence-case"],

		"scope-enum": [RuleConfigSeverity.Error, "always", scopes()],

		"type-empty": [RuleConfigSeverity.Warning, "always"],

		"type-enum": [
			RuleConfigSeverity.Error,
			"always",
			[
				"build",
				"lint",
				"rm",
				"ci",
				"spec",
				"docs",
				"feat",
				"fix",
				"perf",
				"refactor",
				"revert",
				"ui",
				"test",
			],
		],
	},
};

export default Configuration;
