// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package de.computerlyrik.spring.securityobjects.example.web;

import de.computerlyrik.spring.securityobjects.example.domain.Category;
import de.computerlyrik.spring.securityobjects.example.domain.Item;
import de.computerlyrik.spring.securityobjects.example.web.ItemBean;
import de.computerlyrik.spring.securityobjects.example.web.converter.CategoryConverter;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.faces.application.Application;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.component.html.HtmlOutputText;
import javax.faces.component.html.HtmlPanelGrid;
import javax.faces.context.FacesContext;
import org.primefaces.component.autocomplete.AutoComplete;
import org.primefaces.component.inputtext.InputText;
import org.primefaces.component.message.Message;
import org.primefaces.context.RequestContext;
import org.primefaces.event.CloseEvent;

privileged aspect ItemBean_Roo_ManagedBean {
    
    declare @type: ItemBean: @ManagedBean(name = "itemBean");
    
    declare @type: ItemBean: @SessionScoped;
    
    private String ItemBean.name = "Items";
    
    private Item ItemBean.item;
    
    private List<Item> ItemBean.allItems;
    
    private boolean ItemBean.dataVisible = false;
    
    private List<String> ItemBean.columns;
    
    private HtmlPanelGrid ItemBean.createPanelGrid;
    
    private HtmlPanelGrid ItemBean.editPanelGrid;
    
    private HtmlPanelGrid ItemBean.viewPanelGrid;
    
    private boolean ItemBean.createDialogVisible = false;
    
    @PostConstruct
    public void ItemBean.init() {
        columns = new ArrayList<String>();
        columns.add("content");
    }
    
    public String ItemBean.getName() {
        return name;
    }
    
    public List<String> ItemBean.getColumns() {
        return columns;
    }
    
    public List<Item> ItemBean.getAllItems() {
        return allItems;
    }
    
    public void ItemBean.setAllItems(List<Item> allItems) {
        this.allItems = allItems;
    }
    
    public String ItemBean.findAllItems() {
        allItems = Item.findAllItems();
        dataVisible = !allItems.isEmpty();
        return null;
    }
    
    public boolean ItemBean.isDataVisible() {
        return dataVisible;
    }
    
    public void ItemBean.setDataVisible(boolean dataVisible) {
        this.dataVisible = dataVisible;
    }
    
    public HtmlPanelGrid ItemBean.getCreatePanelGrid() {
        if (createPanelGrid == null) {
            createPanelGrid = populateCreatePanel();
        }
        return createPanelGrid;
    }
    
    public void ItemBean.setCreatePanelGrid(HtmlPanelGrid createPanelGrid) {
        this.createPanelGrid = createPanelGrid;
    }
    
    public HtmlPanelGrid ItemBean.getEditPanelGrid() {
        if (editPanelGrid == null) {
            editPanelGrid = populateEditPanel();
        }
        return editPanelGrid;
    }
    
    public void ItemBean.setEditPanelGrid(HtmlPanelGrid editPanelGrid) {
        this.editPanelGrid = editPanelGrid;
    }
    
    public HtmlPanelGrid ItemBean.getViewPanelGrid() {
        return populateViewPanel();
    }
    
    public void ItemBean.setViewPanelGrid(HtmlPanelGrid viewPanelGrid) {
        this.viewPanelGrid = viewPanelGrid;
    }
    
    public HtmlPanelGrid ItemBean.populateCreatePanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText contentCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        contentCreateOutput.setId("contentCreateOutput");
        contentCreateOutput.setValue("Content:   ");
        htmlPanelGrid.getChildren().add(contentCreateOutput);
        
        InputText contentCreateInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        contentCreateInput.setId("contentCreateInput");
        contentCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{itemBean.item.content}", String.class));
        htmlPanelGrid.getChildren().add(contentCreateInput);
        
        Message contentCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        contentCreateInputMessage.setId("contentCreateInputMessage");
        contentCreateInputMessage.setFor("contentCreateInput");
        contentCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(contentCreateInputMessage);
        
        HtmlOutputText categoryCreateOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        categoryCreateOutput.setId("categoryCreateOutput");
        categoryCreateOutput.setValue("Category: * ");
        htmlPanelGrid.getChildren().add(categoryCreateOutput);
        
        AutoComplete categoryCreateInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        categoryCreateInput.setId("categoryCreateInput");
        categoryCreateInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{itemBean.item.category}", Category.class));
        categoryCreateInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{itemBean.completeCategory}", List.class, new Class[] { String.class }));
        categoryCreateInput.setDropdown(true);
        categoryCreateInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "category", String.class));
        categoryCreateInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{category.content}", String.class));
        categoryCreateInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{category}", Category.class));
        categoryCreateInput.setConverter(new CategoryConverter());
        categoryCreateInput.setRequired(true);
        htmlPanelGrid.getChildren().add(categoryCreateInput);
        
        Message categoryCreateInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        categoryCreateInputMessage.setId("categoryCreateInputMessage");
        categoryCreateInputMessage.setFor("categoryCreateInput");
        categoryCreateInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(categoryCreateInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid ItemBean.populateEditPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText contentEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        contentEditOutput.setId("contentEditOutput");
        contentEditOutput.setValue("Content:   ");
        htmlPanelGrid.getChildren().add(contentEditOutput);
        
        InputText contentEditInput = (InputText) application.createComponent(InputText.COMPONENT_TYPE);
        contentEditInput.setId("contentEditInput");
        contentEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{itemBean.item.content}", String.class));
        htmlPanelGrid.getChildren().add(contentEditInput);
        
        Message contentEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        contentEditInputMessage.setId("contentEditInputMessage");
        contentEditInputMessage.setFor("contentEditInput");
        contentEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(contentEditInputMessage);
        
        HtmlOutputText categoryEditOutput = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        categoryEditOutput.setId("categoryEditOutput");
        categoryEditOutput.setValue("Category: * ");
        htmlPanelGrid.getChildren().add(categoryEditOutput);
        
        AutoComplete categoryEditInput = (AutoComplete) application.createComponent(AutoComplete.COMPONENT_TYPE);
        categoryEditInput.setId("categoryEditInput");
        categoryEditInput.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{itemBean.item.category}", Category.class));
        categoryEditInput.setCompleteMethod(expressionFactory.createMethodExpression(elContext, "#{itemBean.completeCategory}", List.class, new Class[] { String.class }));
        categoryEditInput.setDropdown(true);
        categoryEditInput.setValueExpression("var", expressionFactory.createValueExpression(elContext, "category", String.class));
        categoryEditInput.setValueExpression("itemLabel", expressionFactory.createValueExpression(elContext, "#{category.content}", String.class));
        categoryEditInput.setValueExpression("itemValue", expressionFactory.createValueExpression(elContext, "#{category}", Category.class));
        categoryEditInput.setConverter(new CategoryConverter());
        categoryEditInput.setRequired(true);
        htmlPanelGrid.getChildren().add(categoryEditInput);
        
        Message categoryEditInputMessage = (Message) application.createComponent(Message.COMPONENT_TYPE);
        categoryEditInputMessage.setId("categoryEditInputMessage");
        categoryEditInputMessage.setFor("categoryEditInput");
        categoryEditInputMessage.setDisplay("icon");
        htmlPanelGrid.getChildren().add(categoryEditInputMessage);
        
        return htmlPanelGrid;
    }
    
    public HtmlPanelGrid ItemBean.populateViewPanel() {
        FacesContext facesContext = FacesContext.getCurrentInstance();
        Application application = facesContext.getApplication();
        ExpressionFactory expressionFactory = application.getExpressionFactory();
        ELContext elContext = facesContext.getELContext();
        
        HtmlPanelGrid htmlPanelGrid = (HtmlPanelGrid) application.createComponent(HtmlPanelGrid.COMPONENT_TYPE);
        
        HtmlOutputText contentLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        contentLabel.setId("contentLabel");
        contentLabel.setValue("Content:   ");
        htmlPanelGrid.getChildren().add(contentLabel);
        
        HtmlOutputText contentValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        contentValue.setId("contentValue");
        contentValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{itemBean.item.content}", String.class));
        htmlPanelGrid.getChildren().add(contentValue);
        
        HtmlOutputText categoryLabel = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        categoryLabel.setId("categoryLabel");
        categoryLabel.setValue("Category:   ");
        htmlPanelGrid.getChildren().add(categoryLabel);
        
        HtmlOutputText categoryValue = (HtmlOutputText) application.createComponent(HtmlOutputText.COMPONENT_TYPE);
        categoryValue.setValueExpression("value", expressionFactory.createValueExpression(elContext, "#{itemBean.item.category}", Category.class));
        categoryValue.setConverter(new CategoryConverter());
        htmlPanelGrid.getChildren().add(categoryValue);
        
        return htmlPanelGrid;
    }
    
    public Item ItemBean.getItem() {
        if (item == null) {
            item = new Item();
        }
        return item;
    }
    
    public void ItemBean.setItem(Item item) {
        this.item = item;
    }
    
    public List<Category> ItemBean.completeCategory(String query) {
        List<Category> suggestions = new ArrayList<Category>();
        for (Category category : Category.findAllCategorys()) {
            String categoryStr = String.valueOf(category.getContent());
            if (categoryStr.toLowerCase().startsWith(query.toLowerCase())) {
                suggestions.add(category);
            }
        }
        return suggestions;
    }
    
    public String ItemBean.onEdit() {
        return null;
    }
    
    public boolean ItemBean.isCreateDialogVisible() {
        return createDialogVisible;
    }
    
    public void ItemBean.setCreateDialogVisible(boolean createDialogVisible) {
        this.createDialogVisible = createDialogVisible;
    }
    
    public String ItemBean.displayList() {
        createDialogVisible = false;
        findAllItems();
        return "item";
    }
    
    public String ItemBean.displayCreateDialog() {
        item = new Item();
        createDialogVisible = true;
        return "item";
    }
    
    public String ItemBean.persist() {
        String message = "";
        if (item.getId() != null) {
            item.merge();
            message = "Successfully updated";
        } else {
            item.persist();
            message = "Successfully created";
        }
        RequestContext context = RequestContext.getCurrentInstance();
        context.execute("createDialog.hide()");
        context.execute("editDialog.hide()");
        
        FacesMessage facesMessage = new FacesMessage(message);
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllItems();
    }
    
    public String ItemBean.delete() {
        item.remove();
        FacesMessage facesMessage = new FacesMessage("Successfully deleted");
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
        reset();
        return findAllItems();
    }
    
    public void ItemBean.reset() {
        item = null;
        createDialogVisible = false;
    }
    
    public void ItemBean.handleDialogClose(CloseEvent event) {
        reset();
    }
    
}
