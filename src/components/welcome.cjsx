React = require 'react-native'
Temp = require './temp'
PostIndex = require './post_index'

{
  StyleSheet,
  Text,
  View,
  ListView,
  TouchableHighlight,
} = React

SITES = [
  "Deadspin"
  "Gawker"
  "Gizmodo"
  "io9"
  "Jezebel"
  "Kotaku"
  "Lifehacker"
]

module.exports = React.createClass
  getInitialState: ->
    ds = new ListView.DataSource(rowHasChanged: (r1, r2) -> r1 != r2)
    sites: ds.cloneWithRows(SITES)

  newRoute: ->
    @props.navigator.push
      title: "Second page"
      component: Temp
      # rightButtonTitle: 'Cancel'

  navToSite: (site) ->
    @props.navigator.push
      title: site
      component: PostIndex
      passProps: { site: site.toLowerCase()}


  renderRow: (site) ->
    <TouchableHighlight
      style={styles.row}
      onPress={() => @navToSite(site)}
    >
      <Text style={styles.site}>{site}</Text>
    </TouchableHighlight>

  render: ->
    <ListView
      dataSource={@state.sites}
      renderRow={@renderRow}
      style={styles.container}
    />

styles = StyleSheet.create
  row:
    flex: 1
    flexDirection: 'row'
    justifyContent: 'center'
    borderBottomWidth: 0.5
    borderColor: '#ccc'
    backgroundColor: 'white'
  site:
    fontSize: 30
    padding: 20
    fontFamily: "Georgia"
  container:
    flex: 1
    # justifyContent: 'center'
    # alignItems: 'center'
    backgroundColor: 'white'
  welcome:
    fontSize: 20
    textAlign: 'center'
    margin: 10
    color: '#ff00f0'
  instructions:
    textAlign: 'center'
    color: '#333333'
    marginBottom: 5
