<?php /* Smarty version Smarty-3.1.13, created on 2014-02-15 04:02:58
         compiled from "/var/www/artxchange/ps15/modules/blockleocustom3/tmpl/default.tpl" */ ?>
<?php /*%%SmartyHeaderCode:71439095452ff2d42dd43a7-70119617%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'a318ccc50bbfa43cbdbcf6f841ccf8fe8cc0cd57' => 
    array (
      0 => '/var/www/artxchange/ps15/modules/blockleocustom3/tmpl/default.tpl',
      1 => 1371670688,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '71439095452ff2d42dd43a7-70119617',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'class_prefix' => 0,
    'pos' => 0,
    'show_title' => 0,
    'module_title' => 0,
    'content' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_52ff2d42de9473_79726102',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_52ff2d42de9473_79726102')) {function content_52ff2d42de9473_79726102($_smarty_tpl) {?><div class="customhtml block <?php echo $_smarty_tpl->tpl_vars['class_prefix']->value;?>
" id="leo-customhtml-<?php echo $_smarty_tpl->tpl_vars['pos']->value;?>
">
	<?php if ($_smarty_tpl->tpl_vars['show_title']->value){?>
		<h3 class="title_block"><?php echo $_smarty_tpl->tpl_vars['module_title']->value;?>
</h3>
	<?php }?>
	<div class="block_content">
		<?php echo $_smarty_tpl->tpl_vars['content']->value;?>

	</div>
</div><?php }} ?>