({
    doInit : function(component, event, helper) {
        component.set("v.columns", [
            {fieldName:"articles.Title", type:"Text"},
            
        ]);

        let action = component.get("c.getTopHeadlines"); 
        
        action.setCallback(this, function(data) {
            component.set("v.articles", data.getReturnValue());
        });
        $A.enqueueAction(action);
     
    }
})
