{include file="default_web20cart/views/header.tpl"}
{include file="default_web20cart/views/usersAndGroups/navigation_main.tpl"}

   {if is_null($user_obj)}
       <p class="not_found">No Users found<p>
   {else}
       <table class="table_my" cellpadding="0" cellspacing="0" border="0">
           <tr>

               <th>{'USER_'|onapp_string}</th>
               <th>{'LOGIN_'|onapp_string}</th>
               <th>{'E_MAIL'|onapp_string}</th>
               <th>{'ROLES_USER_GROUP'|onapp_string}</th>
               <th></th>
               <th></th>
           </tr>
       {foreach from=$user_obj item=user}
           <tr>
               <td>
                   <a href="{$_ALIASES["users_and_groups"]}?action=details&amp;id={$user->_id}">
                       <span title="{$user->_first_name} {$user->_last_name}">
                           {$user->_first_name|onapp_table_display}
                           {$user->_last_name|onapp_table_display}
                       </span>
                   </a>
                   <br /> {$user->_status}
               </td>
               <td>
                   <span title="{$user->_login}">{$user->_login|onapp_table_display}</span>
               </td>
               <td>
                   <span title="{$user->_email}">{$user->_email|onapp_table_display}</span>
               </td>
               <td>
                   {foreach from=$user->_roles item=roles}
                      ( as {$roles->_label} )&nbsp;
                   {/foreach}
                   <br /> {if isset($user_group_labels[$user->_id])}
                              {$user_group_labels[$user->_id]}
                          {else}
                              {'UNDEFINED_'|onapp_string}
                          {/if}
               </td>
               <td class="blue">
                   <a href="{$_ALIASES["virtual_machines"]}?action=view&amp;user_id={$user->_id}">{'VIRTUAL_MACHINES'|onapp_string}</a>
                   <a href="{$_ALIASES["users_and_groups"]}?action=payments&amp;id={$user->_id}">{'PAYMENTS_'|onapp_string}</a>
                   <!-- <a href="{$_ALIASES["users_and_groups"]}?action=billing_plan&amp;id={$user->_id}">{'BILLING_PLAN'|onapp_string}</a> TODO Ticket # -->
                   <a href="{$_ALIASES["users_and_groups"]}?action=monthly_bills&amp;id={$user->_id}">{'MONTHLY_BILLS'|onapp_string}</a>
                   <a href="{$_ALIASES["users_and_groups"]}?action=statistics&amp;id={$user->_id}">{'USER_STATISTICS'|onapp_string}</a>
               </td>
               <td class="one_icon_td">
               {if $user->_status != 'deleted' && $user->_status != 'suspended'}
                   <a href="{$_ALIASES["users_and_groups"]}?action=edit&amp;id={$user->_id}">
                       <img title="{'EDIT_'|onapp_string}" src="templates/{$smarty.const.ONAPP_TEMPLATE}/images/edit.png" />
                   </a>
                   <a href="{$_ALIASES["users_and_groups"]}?action=delete&amp;id={$user->_id}">
                       <img title="{'DELETE_'|onapp_string}" src="templates/{$smarty.const.ONAPP_TEMPLATE}/images/delete_icon.png" />
                   </a>
                   <a href="{$_ALIASES["users_and_groups"]}?action=suspend&amp;id={$user->_id}">
                       <img title="{'SUSPEND_USER'|onapp_string}" src="templates/{$smarty.const.ONAPP_TEMPLATE}/images/stop.png" />
                   </a>
                   <a href="{$_ALIASES["users_and_groups"]}?action=white_list&amp;id={$user->_id}">
                       <img title="{'WHITE_IP_LIST'|onapp_string}" src="templates/{$smarty.const.ONAPP_TEMPLATE}/images/network.png" />
                   </a>
               {elseif $user->_status == 'suspended'}
                   <a href="{$_ALIASES["users_and_groups"]}?action=activate&amp;id={$user->_id}">
                       <img title="{'ACTIVATE_USER'|onapp_string}" src="templates/{$smarty.const.ONAPP_TEMPLATE}/images/play.png" />
                   </a>
               {else}
                   <a href="{$_ALIASES["users_and_groups"]}?action=delete&amp;id={$user->_id}">
                       <img title="{'DELETE_'|onapp_string}" src="templates/{$smarty.const.ONAPP_TEMPLATE}/images/delete_icon.png" />
                   </a>erase all
               {/if}
                   
               </td>
           </tr>
        {/foreach}
    {/if}
        </table>
        <form style="float:right" action='{$_ALIASES["users_and_groups"]}' method="post">
            <input type="hidden" name = "action" value="create" />
            <input type="submit" value="{'ADD_A_NEW_USER'|onapp_string}" />
        </form>


{include file="default_web20cart/views/navigation.tpl"}
{include file="default_web20cart/views/footer.tpl"}
