return {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate',
        config = function()
          require'nvim-treesitter'.install { 'rust', 'lua', 'javascript', 'typescript', 'python' }
          vim.api.nvim_create_autocmd('FileType', {
            pattern = { 'rust', 'lua', 'javascript', 'typescript', 'python' },
            callback = function() vim.treesitter.start() end
          })
        end

      }
