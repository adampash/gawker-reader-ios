React = require 'react-native'

{
  StyleSheet,
  Text,
  View,
} = React

module.exports = React.createClass
  render: ->
    <View style={styles.container} onClick={@newRoute}>
      <Text style={styles.welcome}>
        Second page now!
      </Text>
      <Text style={styles.instructions}>
        To get started, edit index.ios.js
      </Text>
      <Text style={styles.instructions}>
        Press Cmd+R to reload,{'\n'}
        Cmd+D or shake for dev menu
      </Text>
    </View>

styles = StyleSheet.create
  container:
    flex: 1
    justifyContent: 'center'
    alignItems: 'center'
    backgroundColor: '#F5FCFF'
  welcome:
    fontSize: 20
    textAlign: 'center'
    margin: 10
  instructions:
    textAlign: 'center'
    color: '#333333'
    marginBottom: 5
