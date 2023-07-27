Scaffold(
        appBar: AppBar(
          title: Text('TravelMate'),
        ),
        body: _tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.blue,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.blue,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.directions, color: Colors.blue),
              label: 'Trip Planning',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.store, color: Colors.blue),
              label: 'Marketplace',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
                color: Colors.blue,
              ),
              label: 'Chat',
            ),
          ],
        ),
      ),