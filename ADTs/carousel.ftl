<div class="slide-show">
    <#if entries?has_content>
    	<#list entries as entry>

            <#assign assetRenderer = entry.getAssetRenderer() />
			<#assign article = assetRenderer.getArticle()/>
			<#assign entryTitle = htmlUtil.escape(assetRenderer.getTitle(locale)) /><#--  -->

            <#assign article = assetRenderer.getArticle()/>
            <#assign doc = saxReaderUtil.read(article.getContentByLocale(locale)) />
			
			 <#assign image = doc.selectSingleNode("/root/dynamic-element[@name='image']/dynamic-content").getText() />

    		
            <div class="slide" style="background-image: url('${image}');">
    		
    		    <div class="lfr-meta-actions asset-actions" style="float: none">
			         <@getEditIcon/> 
			    </div>
    		    
    		    <div class="slide-title">
    		        ${entry.getTitle(locale)}
    		    </div>
    		</div>
    		
    		
    	</#list>
    </#if>
</div>

<script type="text/javascript" charset="utf-8">
$(document).ready(function(){
 $('.slide-show').slick({
  dots: true,
  prevArrow: '<i class="fa fa-angle-left gallery-prev" aria-hidden="true"></i>',
  nextArrow: '<i class="fa fa-angle-right gallery-next" aria-hidden="true"></i>'
 });
});
</script>


<#macro getEditIcon>
	<#if assetRenderer.hasEditPermission(themeDisplay.getPermissionChecker())>
		<#assign redirectURL = renderResponse.createRenderURL() />

		${redirectURL.setParameter("mvcPath", "/add_asset_redirect.jsp")}
		${redirectURL.setWindowState("pop_up")}

		<#assign editPortletURL = assetRenderer.getURLEdit(renderRequest, renderResponse, windowStateFactory.getWindowState("pop_up"), redirectURL)!"" />

		<#if validator.isNotNull(editPortletURL)>
			<#assign title = languageUtil.format(locale, "edit-x", entryTitle, false) />

			<@liferay_ui["icon"]
				cssClass="icon-monospaced visible-interaction"
				icon="pencil"
				markupView="lexicon"
				message=title
				url="javascript:Liferay.Util.openWindow({id:'" + renderResponse.getNamespace() + "editAsset', title: '" + title + "', uri:'" + htmlUtil.escapeURL(editPortletURL.toString()) + "'});"
			/>
		</#if>
	</#if>

</#macro>