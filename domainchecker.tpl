{include file="$template/includes/alert.tpl" type="danger" msg="{$LANG.searchtermrequired}" textcenter=true idname="searchTermRequired" additionalClasses="domain-checker-error" hide=true}

{include file="$template/includes/alert.tpl" type="danger" msg="{$LANG.invalidchars}" textcenter=true idname="invalidChars" additionalClasses="domain-checker-error" hide=true}

{if $errorMsg}
    {include file="$template/includes/alert.tpl" type="danger" msg=$errorMsg textcenter=true idname="invalidDomainError" additionalClasses="domain-checker-error"}
{else}
    {include file="$template/includes/alert.tpl" type="danger" msg="{$LANG.unabletolookup}" textcenter=true idname="invalidDomainError" additionalClasses="domain-checker-error" hide=true}
{/if}

<div class="domain-checker-container">
    <div class="domain-checker-bg clearfix">
        <form id="frmDomainChecker">
            <div class="row">
                <div class="col-md-8 col-md-offset-2 col-xs-10 col-xs-offset-1">
                    {if $bulkdomainsearchenabled}
                        <div class="domain-bulk-options-box hidden-xs">
                            <a href="domainchecker.php?search=bulk" id="btnBulkOptions" class="btn btn-warning btn-sm">{$LANG.bulkoptions}</a>
                        </div>
                    {/if}
                    <div class="input-group input-group-lg input-group-box">
                        <input type="text" class="form-control" placeholder="{$LANG.findyourdomain}" value="{$domain}" id="inputDomain" />
                        <span class="input-group-btn">
                            <button type="submit" id="btnCheckAvailability" class="btn btn-primary domain-check-availability">{$LANG.search}</button>
                        </span>
                    </div>
                </div>
            </div>

            {include file="$template/includes/captcha.tpl"}
        </form>
    </div>
</div>
<div class="domain-step-options hidden" id="stepBulkOptions">
    <textarea class="form-control" rows="10" cols="60" id="inputBulkDomains"></textarea>
</div>
<div class="domain-step-options{if !$performingLookup} hidden{/if}" id="stepResults">
    {include file="$template/domainchecker-results.tpl"}
</div>

<script>
    var langSearch = '{$LANG.search}';
    var langAdding = '{$LANG.domaincheckeradding}';
    var langAdded = '{$LANG.domaincheckeradded}';
    var langUnavailable = '{$LANG.domainunavailable}';
    var langBulkPlaceholder = '{$LANG.domaincheckerbulkplaceholder|escape:'quotes'|replace:"\n":'\n'}';
</script>
<script src="templates/{$template}/js/domainchecker.js"></script>

{include file="$template/includes/modal.tpl" name="CheckUnavailable" title="{$LANG.domainchecker.suggestiontakentitle}" content="{$LANG.domainchecker.suggestiontakenmsg}" closeLabel="{$LANG.domainchecker.suggestiontakenchooseanother}"}

{include file="$template/includes/modal.tpl" name="AlreadyInCart" title="{$LANG.domainchecker.alreadyincarttitle}" content="{$LANG.domainchecker.alreadyincartmsg}" submitAction="window.location='cart.php?a=checkout'" submitLabel="{$LANG.domainchecker.alreadyincartcheckoutnow}"}

{include file="$template/includes/modal.tpl" name="AddToCartError" title="{$LANG.genericerror.title}" content="{$LANG.genericerror.msg}"}
