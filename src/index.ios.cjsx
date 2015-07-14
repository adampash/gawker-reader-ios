React = require 'react-native'
Welcome = require './components/welcome'

{
  AppRegistry,
  StyleSheet,
  Text,
  View,
  NavigatorIOS
} = React

reader = React.createClass
  render: ->
    <NavigatorIOS
      initialRoute={
        component: Welcome,
        title: 'Reader',
      }
      style={styles.container}
    />

styles = StyleSheet.create
  container:
    flex: 1
    backgroundColor: 'white'

AppRegistry.registerComponent('reader', () -> reader)
