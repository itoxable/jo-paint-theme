<div class="block-links">
    <#if entries?has_content>   
    <#assign layoutLocalService = serviceLocator.findService('com.liferay.portal.kernel.service.LayoutLocalService') />
    	<#list entries as entry>

            <#assign assetRenderer = entry.getAssetRenderer() />
			<#assign article = assetRenderer.getArticle()/>
			<#assign entryTitle = htmlUtil.escape(assetRenderer.getTitle(locale)) />
            <#assign article = assetRenderer.getArticle()/>
            <#assign doc = saxReaderUtil.read(article.getContentByLocale(locale)) />

			<#assign imageNode = doc.selectSingleNode("/root/dynamic-element[@name='image']/dynamic-content") />
			<#assign image = imageNode.getText() />
			<#assign imageAlt = imageNode.valueOf("@alt") />

			<#assign imageDescription = article.getDescription(locale) />




    		<#assign link = doc.selectSingleNode("/root/dynamic-element[@name='link']/dynamic-content").getText() />
            <#assign linkDetails = link?split("@") />

            <#assign pageLayout = layoutLocalService.getLayout(linkDetails[2]?number, false, linkDetails[0]?number) />

            <#if pageLayout?has_content>
                <div class="link-wrapper">
    				<a class="link" href="${pageLayout.getFriendlyURL()}">
    
    					<div class="lfr-meta-actions asset-actions" style="float: none">
        			         <@getEditIcon/> 
        			    </div>
    
    					<div class="link-image"  >
    						<img src="${image}" alt="${imageAlt}">
    					</div>
    					
    					<div class="link-txt" >
        					<h3 class="link-name">
        						${entry.getTitle(locale)}
        					</h3>
        					<p class="link-description" >
        						${imageDescription}
        					</p>
    					</div>
    					
                
            		</a>
            		<a class="link-name" href="${pageLayout.getFriendlyURL()}">
    					${entry.getTitle(locale)}
    				</a>
				</div>
    		</#if>
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