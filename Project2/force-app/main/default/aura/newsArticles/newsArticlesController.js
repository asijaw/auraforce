({
    loadArticles : function(component, event, helper) {

        let action = component.get("c.getCrypto"); 
        
        action.setCallback(this, function(data) {
            component.set("v.articles", data.getReturnValue());
        });
        $A.enqueueAction(action);
      
    },
    openModel: function(component, event, helper) {
        // for Display Model,set the "isOpen" attribute to "true"
        let site = component.find("value")
        
        //component.set("v.isOpen", true);
        window.open(site, "MsgWindow", "width=200,height=100")
    },
   
    closeModel: function(component, event, helper) {
        // for Hide/Close Model,set the "isOpen" attribute to "Fasle"  
        component.set("v.isOpen", false);
    }

    // favorite : function(component, event, helper) {
    //     let action = component.get("c.saveItem")
    //     action.setParams("article" = {"author__c":"{!v.article.author}", 
    //                       "title__c" : "{!v.article.title}", 
    //                       "description__c" : "{!v.article.description}",
    //                       "content__c" : "{!v.article.content}"})
    //     action.setCallback(this, function(response){
    //         var state = response.getState();
    //         if (component.isValid() && state === "SUCCESS") {
                
    //             var article = component.get("v.article");
    //             items.push(response.getReturnValue());
    //             component.set("v.items", items);
    //         }
    //     })
    //     $A.enqueueAction(action);
       
        
    //     // component.set("v.item", item)
    //     // event.getSource().set("v.disabled",true)
    // }

})
