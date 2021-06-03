# berbix-ios-demo
A demo app for testing out the Berbix iOS SDK. This example is meant to illustrate how to integrate the 
Berbix Client into an iOS app. A valid `client_token` is required and can be generated from a 
backend SDK or from the API docs. 

## How to use

Replace `enter-your-token` in `ViewController.swift` with a valid client token for testing. 

```
@IBAction func startFlowFromAPI(_ sender: Any) {
    let token = "<enter-your-token>" // MARK: ENTER TOKEN HERE
    let config = BerbixConfigurationBuilder()
        .withClientToken(token)
        .build()
    DispatchQueue.main.async {
        self.sdk.startFlow(self, delegate: self, config: config)
    }
}
```

See [Generating development client tokens](https://docs.berbix.com/docs/testing#generating-development-client-tokens-for-client-side-sdks) for more 
information on how to generate a client token for testing and development.  

## Result Handling

In this demo, the `completed` and `failed` handlers just display a message on the main screen. In a real app, the client could check with a
backend server to determine the verification result and decide whether to allow the user to proceed within the app.

## Full Integration Docs

See the full iOS Client SDK Docs [here](https://docs.berbix.com/docs/ios). 

## Help

For further help with integrations or issues, please contact support@berbix.com, or via your customer support channel.
