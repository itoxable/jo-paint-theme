<div class="gallery layout-column">
    <#if entries?has_content>   
    <#assign layoutLocalService = serviceLocator.findService('com.liferay.portal.kernel.service.LayoutLocalService') />
    	<#list entries as entry>

            <#assign assetRenderer = entry.getAssetRenderer() />
			<#assign article = assetRenderer.getArticle()/>
			<#assign entryTitle = htmlUtil.escape(assetRenderer.getTitle(locale)) />
            <#assign article = assetRenderer.getArticle()/>
            <#assign doc = saxReaderUtil.read(article.getContentByLocale(locale)) />



			<#assign assetViewURL = assetPublisherHelper.getAssetViewURL(renderRequest, renderResponse, entry) />
			<#assign viewURL = assetRenderer.getURLViewInContext(renderRequest, renderResponse, assetViewURL) />

			<#assign articleDescription = article.getDescription(locale) />
			<#assign imageNode = doc.selectSingleNode("/root/dynamic-element[@name='image']/dynamic-content") />
			<#assign image = imageNode.getText() />
			<#assign imageAlt = imageNode.valueOf("@alt") />
			<#assign imageDescription = doc.selectSingleNode("/root/dynamic-element[@name='description']/dynamic-content").getText()  />

			<a class="item" href="${viewURL}" >
				<div class="lfr-meta-actions asset-actions" style="float: none">
					<@getEditIcon/> 
				</div>
				
				<div class="item-image">
					<img src="${image}">
				</div>
				
				<div class="item-title">
					${entry.getTitle(locale)}
				</div>
				
			</a>

    	</#list>
    </#if>
</div>
<script type="text/javascript" charset="utf-8">
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