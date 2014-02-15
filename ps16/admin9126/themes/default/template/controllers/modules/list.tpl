{*
* 2007-2014 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2014 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<table id="module-list" class="table">
	<thead>
		<tr>
			<th width="1%">
				<!-- <input type="checkbox" rel="false" class="noborder" id="checkme"> -->
			</th>
			<th colspan="3">
				<div class="pull-left">
					{include file='controllers/modules/filters.tpl'}
				</div>
				<div class="btn-group pull-right">
					<a class="btn btn-default {if !isset($smarty.get.select)} active{/if}" href="index.php?controller={$smarty.get.controller|htmlentities}&token={$smarty.get.token|htmlentities}" title="{l s='Normal view'}">
						<i class="icon-list"></i> 
					</a>
					<a class="btn btn-default {if isset($smarty.get.select) && $smarty.get.select == 'favorites'} active{/if}" href="index.php?controller={$smarty.get.controller|htmlentities}&token={$smarty.get.token|htmlentities}&select=favorites" title="{l s='Favorites view'}">
						<i class="icon-star"></i>
					</a>
				</div>
			</th>
		</tr>
	</thead>
	{if count($modules)}
		<tbody>
			{foreach from=$modules item=module}
			
{capture name="moduleStatutClass"}
{if isset($module->id) && $module->id gt 0 && $module->active == 1}
module_active
{else}
module_inactive
{/if}
{/capture}
				<tr>
					<td class="{{$smarty.capture.moduleStatutClass}}">
						{if (isset($module->id) && $module->id > 0) || !isset($module->type) || $module->type != 'addonsMustHave'}
						<input type="checkbox" name="modules" value="{$module->name}"
							{if !isset($module->confirmUninstall) OR empty($module->confirmUninstall)}rel="false"{else}rel="{$module->confirmUninstall|addslashes}"{/if}
							class="noborder" title="{l s='Module %1s '|sprintf:$module->name}" />
						{/if}
					</td>
					<td class="fixed-width-xs">
						<img width="32" alt="{$module->displayName}" title="{$module->displayName}" src="{if isset($module->image)}{$module->image}{else}{$modules_uri}/{$module->name}/{$module->logo}{/if}" />
					</td>
					<td>
						<div id="anchor{$module->name|ucfirst}" title="{$module->displayName}">
							<div class="text-muted">
								{$module->categoryName}
							</div>
							<div class="module_name">
								<span style="display:none">{$module->name}</span>
								{$module->displayName}
								<small class="text-muted">v{$module->version} - by {$module->author}</small>
								{if isset($module->type) && $module->type == 'addonsMustHave'}
									- <a href="#" class="module-badge-popular help-tooltip text-primary" data-title="{l s="This module is available on PrestaShop Addons"}"><i class="icon-group"></i> <small>{l s="Popular"}</small></a>
								{elseif isset($module->type) && $module->type == 'addonsPartner'}
									- <a href="#" class="module-badge-partner help-tooltip text-warning" data-title="{l s="This module is available for free thanks to our partner."}"><i class="icon-pushpin"></i> <small>{l s="Partner"}</small></a>
								{elseif isset($module->id) && $module->id gt 0}
									{if isset($module->version_addons) && $module->version_addons}
										<span class="label label-warning">{l s='Need update'}</span>
									{/if}
								{/if}
							</div>
							<p class="module_description">
								{if isset($module->description) && $module->description ne ''}
									{$module->description}
								{/if}
							</p>
							{if isset($module->message) && (empty($module->name) !== false) && (!isset($module->type) || ($module->type != 'addonsMustHave' || $module->type !== 'addonsNative'))}<div class="alert alert-success">{$module->message}</div>{/if}
						</div>
					</td>
					<td class="actions">
						<div class="btn-group-action">
							<div class="btn-group pull-right">
								{if isset($module->type) && $module->type == 'addonsMustHave'}
									<a class="btn btn-default" href="{$module->addons_buy_url}" target="_blank">
										<i class="icon-shopping-cart"></i> &nbsp;{if isset($module->id_currency) && isset($module->price)}{displayPrice price=$module->price currency=$module->id_currency}{/if}
									</a>
								{else}
									{if isset($module->id) && $module->id gt 0}
										{if isset($module->version_addons) && $module->version_addons}
											<a class="btn btn-warning" href="{$module->options.update_url}">
												<i class="icon-refresh"></i> {l s='Update it!'}
											</a>
										{elseif !isset($module->not_on_disk)}
											{if $module->optionsHtml|count > 0}
												{assign var=option value=$module->optionsHtml[0]}
												{$option}
											{/if}
										{else}
											<a class="btn btn-danger" {if !empty($module->options.uninstall_onclick)}onclick="{$module->options.uninstall_onclick}"{/if} href="{$module->options.uninstall_url}">
												<i class="icon-minus-sign-alt"></i>&nbsp;{l s='Uninstall'}
											</a>
										{/if}
									{else}
										<a class="btn btn-success" href="{$module->options.install_url}">
											<i class="icon-plus-sign-alt"></i>&nbsp;{l s='Install'}
										</a>
									{/if}
									{if !isset($module->not_on_disk)}
									<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" >
										<span class="caret">&nbsp;</span>
									</button>

									<ul class="dropdown-menu">
										{foreach $module->optionsHtml key=key item=option}
											{if $key != 0}
												<li>{$option}</li>
											{/if}
										{/foreach}
										{if isset($module->preferences) && isset($module->preferences['favorite']) && $module->preferences['favorite'] == 1}
										<li>
											<a class="action_module action_unfavorite toggle_favorite" data-module="{$module->name}" data-value="0" href="#">
												<i class="icon-star"></i> {l s='Remove from Favorites'}
											</a>
											<a class="action_module action_favorite toggle_favorite" data-module="{$module->name}" data-value="1" href="#" style="display: none;">
												<i class="icon-star"></i> {l s='Mark as Favorite'}
											</a>
										</li>
										{else}
										<li>
											<a class="action_module action_unfavorite toggle_favorite" data-module="{$module->name}" data-value="0" href="#" style="display: none;">
												<i class="icon-star"></i> {l s='Remove from Favorites'}
											</a>
											<a class="action_module action_favorite toggle_favorite" data-module="{$module->name}" data-value="1" href="#">
												<i class="icon-star"></i> {l s='Mark as Favorite'}
											</a>
										</li>
										{/if}
									</ul>
									{else}
										&nbsp;
									{/if}
								{/if}
							</div>
						</div>
					</td>
				</tr>
			{/foreach}
		</tbody>
		<tfoot>
			<tr>
				<td colspan="4">
					<div class="btn-group pull-left">
						<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
							{l s='bulk actions'}
							 <span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<li>
							 	<a href="#" onclick="modules_management('install')">
									<i class="icon-plus-sign-alt"></i>&nbsp;
									{l s='Install the selection'}
								</a>
							</li>
							<li>
								<a href="#" onclick="modules_management('uninstall')">
									<i class="icon-minus-sign-alt"></i>&nbsp;
									{l s='Uninstall the selection'}
								</a>
							</li>
						</ul>
					</div>
				</td>
			</tr>
		</tfoot>
	{else}
		<tbody>
			<tr>
				<td colspan="4" class="text-center"><i class="icon-warning-sign"></i> {l s='No modules available in this section.'}</td>
			</tr>
		</tbody>
	{/if}
</table>