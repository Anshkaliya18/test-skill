import { copyFileSync, mkdirSync } from 'fs';
import { dirname, join } from 'path';
import { homedir } from 'os';
import { fileURLToPath } from 'url';

const skills = ['resume-make', 'resume-update', 'resume-suggest'];
const args = new Set(process.argv.slice(2));
const globalInstall = args.has('--global');
const projectDir = process.cwd();

function unique(paths) {
  return [...new Set(paths)];
}

const globalTargets = unique([
  join(homedir(), '.claude', 'skills'),
  join(homedir(), '.agents', 'skills'),
  join(homedir(), '.codex', 'skills'),
  join(homedir(), '.config', 'opencode', 'skills'),
  join(homedir(), '.config', 'kilo', 'skills'),
  join(homedir(), '.qwen', 'skills'),
  ...(process.env.APPDATA ? [join(process.env.APPDATA, 'opencode', 'skills')] : []),
]);

const projectTargets = [
  join(projectDir, '.claude', 'skills'),
  join(projectDir, '.agents', 'skills'),
  join(projectDir, '.codex', 'skills'),
  join(projectDir, '.opencode', 'skills'),
  join(projectDir, '.kilo', 'skills'),
  join(projectDir, '.qwen', 'skills'),
];

const targets = globalInstall ? globalTargets : projectTargets;
const scriptDir = dirname(fileURLToPath(import.meta.url));
const srcRoot = join(scriptDir, '..', 'skills');

for (const target of targets) {
  for (const skill of skills) {
    const src = join(srcRoot, skill, 'SKILL.md');
    const dest = join(target, skill, 'SKILL.md');
    mkdirSync(dirname(dest), { recursive: true });
    copyFileSync(src, dest);
    console.log(`Installed ${skill} -> ${dest}`);
  }
}

console.log(
  globalInstall
    ? 'Resume skills installed globally for supported agents.'
    : `Resume skills installed to project: ${projectDir}`
);
