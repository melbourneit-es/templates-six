{include file="$template/includes/tablelist.tpl" tableName="ServicesList" filterColumn="2"}
<script type="text/javascript">
    jQuery(document).ready( function ()
    {
        var table = jQuery('#tableServicesList').removeClass('hidden').DataTable();
        {if $orderby == 'product'}
        table.order([0, '{$sort}'], [1, 'asc']);
        {elseif $orderby == 'domainstatus'}
        table.order(1, '{$sort}');
        {/if}
        table.draw();
        jQuery('#tableLoading').addClass('hidden');
    });
</script>
<div class="table-container clearfix">
    <table id="tableServicesList" class="table table-list hidden">
        <thead>
        <tr>
            <th style="text-align: left;">{$LANG.orderproduct}</th>
            <th>{$LANG.clientareastatus}</th>
            <th class="responsive-edit-button" style="display: none;"></th>
        </tr>
        </thead>
        <tbody>
        {foreach key=num item=service from=$services}
            <tr onclick="clickableSafeRedirect(event, 'clientarea.php?action=productdetails&amp;id={$service.id}', false)">
                <td><strong>{$service.product}</strong>{if $service.domain}<br /><a href="http://{$service.domain}" target="_blank">{$service.domain}</a>{/if}</td>
                <td class="text-center"><span class="label status status-{$service.status|strtolower}">{$service.statustext}</span></td>
                <td class="responsive-edit-button" style="display: none;">
                    <a href="clientarea.php?action=productdetails&amp;id={$service.id}" class="btn btn-block btn-info">
                        {$LANG.manageproduct}
                    </a>
                </td>
            </tr>
        {/foreach}
        </tbody>
    </table>
    <div class="text-center" id="tableLoading">
        <p><i class="fa fa-spinner fa-spin"></i> {$LANG.loading}</p>
    </div>
</div>
