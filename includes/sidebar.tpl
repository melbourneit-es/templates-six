{foreach $sidebar as $item}
    <div menuItemName="{$item->getName()}" class="panel panel-sidebar {if $item->getClass()}{$item->getClass()}{else}panel-sidebar{/if}{if $item->getExtra('mobileSelect') and $item->hasChildren()} hidden-sm hidden-xs{/if}"{if $item->getAttribute('id')} id="{$item->getAttribute('id')}"{/if}>
        <div class="panel-heading">
            <h3 class="panel-title">
                {if $item->hasIcon()}<i class="{$item->getIcon()}"></i>&nbsp;{/if}
                {$item->getLabel()}
                {if $item->hasBadge()}&nbsp;<span class="badge">{$item->getBadge()}</span>{/if}
                <i class="fa fa-chevron-up panel-minimise pull-right"></i>
            </h3>
        </div>
        {if $item->hasBodyHtml()}
            <div class="panel-body">
                {$item->getBodyHtml()}
            </div>
        {/if}
        {if $item->hasChildren()}
            <div class="list-group{if $item->getChildrenAttribute('class')} {$item->getChildrenAttribute('class')}{/if}">
                {foreach $item->getChildren() as $childItem}
                    {if $childItem->getUri()}
                        {if $childItem->getName() neq "Order New Services" && $childItem->getName() neq "Register New Domain"
                        && $childItem->getName() neq "Register a New Domain" && $childItem->getName() neq "Renew Domain"
                        && $childItem->getName() neq "Transfer in a Domain" && $childItem->getName() neq "Cancel"
                        && $childItem->getName() neq "Place a New Order" && $childItem->getName() neq "View Available Addons"
                        && $childItem->getName() neq "Billing Information" && $childItem->getName() neq "Contacts/Sub-Accounts"
                        && $childItem->getName() neq "Email History" && $childItem->getName() neq "Domain Addons"}
                            <a menuItemName="{$childItem->getName()}" href="{$childItem->getUri()}" class="list-group-item{if $childItem->isDisabled()} disabled{/if}{if $childItem->getClass()} {$childItem->getClass()}{/if}{if $childItem->isCurrent()} active{/if}"{if $childItem->getAttribute('dataToggleTab')} data-toggle="tab"{/if}{if $childItem->getAttribute('target')} target="{$childItem->getAttribute('target')}"{/if} id="{$childItem->getId()}">
                            {if $childItem->hasBadge()}<span class="badge">{$childItem->getBadge()}</span>{/if}
                                {if $childItem->hasIcon()}<i class="{$childItem->getIcon()}"></i>&nbsp;{/if}
                                {$childItem->getLabel()}
                            </a>
                        {/if}
                    {else}
                        <div menuItemName="{$childItem->getName()}" class="list-group-item{if $childItem->getClass()} {$childItem->getClass()}{/if}" id="{$childItem->getId()}">
                            {if $childItem->hasBadge()}<span class="badge">{$childItem->getBadge()}</span>{/if}
                            {if $childItem->hasIcon()}<i class="{$childItem->getIcon()}"></i>&nbsp;{/if}
                            {$childItem->getLabel()}
                        </div>
                    {/if}
                {/foreach}
            </div>
        {/if}
        {if $item->hasFooterHtml()}
            <div class="panel-footer clearfix">
                {$item->getFooterHtml()}
            </div>
        {/if}
    </div>
    {if $item->getExtra('mobileSelect') and $item->hasChildren()}
        {* Mobile Select only supports dropdown menus *}
        <div class="panel hidden-lg hidden-md {if $item->getClass()}{$item->getClass()}{else}panel-default{/if}"{if $item->getAttribute('id')} id="{$item->getAttribute('id')}"{/if}>
            <div class="panel-heading">
                <h3 class="panel-title">
                    {if $item->hasIcon()}<i class="{$item->getIcon()}"></i>&nbsp;{/if}
                    {$item->getLabel()}
                    {if $item->hasBadge()}&nbsp;<span class="badge">{$item->getBadge()}</span>{/if}
                </h3>
            </div>
            <div class="panel-body">
                <form role="form">
                    <select class="form-control" onchange="selectChangeNavigate(this)">
                        {foreach $item->getChildren() as $childItem}
                            {if $childItem->getName() neq "Order New Services" && $childItem->getName() neq "Register New Domain"
                            && $childItem->getName() neq "Register a New Domain" && $childItem->getName() neq "Renew Domain"
                            && $childItem->getName() neq "Transfer in a Domain" && $childItem->getName() neq "Cancel"
                            && $childItem->getName() neq "Place a New Order" && $childItem->getName() neq "View Available Addons"
                            && $childItem->getName() neq "Billing Information" && $childItem->getName() neq "Contacts/Sub-Accounts"
                            && $childItem->getName() neq "Email History" && $childItem->getName() neq "Domain Addons"}
                                <option menuItemName="{$childItem->getName()}" value="{$childItem->getUri()}" class="list-group-item" {if $childItem->isCurrent()}selected="selected"{/if}>
                                    {$childItem->getLabel()}
                                    {if $childItem->hasBadge()}({$childItem->getBadge()}){/if}
                                </option>
                            {/if}
                        {/foreach}
                    </select>
                </form>
            </div>
            {if $item->hasFooterHtml()}
                <div class="panel-footer">
                    {$item->getFooterHtml()}
                </div>
            {/if}
        </div>
    {/if}
{/foreach}
