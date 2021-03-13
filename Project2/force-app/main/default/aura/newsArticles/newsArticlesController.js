({
    loadArticles : function(component, event, helper) {

        let action = component.get("c.getCrypto"); 
        
        action.setCallback(this, function(data) {
            component.set("v.articles", data.getReturnValue());
        });
        $A.enqueueAction(action);
      
    }

})
