import neostandard, { resolveIgnoresFromGitignore } from 'neostandard'

export default [
  {
    name: 'Custom Ignores',
    ignores: [
      ...resolveIgnoresFromGitignore(),
    ],
  },
  ...neostandard(),
  {
    name: 'Custom Rules',
    rules: {
      'object-shorthand': 'off',
      '@stylistic/comma-dangle': ['error', {
        arrays: 'always-multiline',
        objects: 'always-multiline',
        imports: 'never',
        exports: 'never',
        functions: 'never',
      }],
    },
  },
]
