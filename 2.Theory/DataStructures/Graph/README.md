# Graph

## ㅁ Contents
- 그래프를 저장하는 방법
    + node / edge 구분해서 저장 - 순서쌍
    + 2차원 배열
- 개념
- 탐색방법


## ㅁ 개념
- Graph : 
> 정의: A Graph G is an ordered pair of a set V of verticies and a set E of edges.
> Vertex : 데이터를 표현하는 정점
> Edge : Verticies 끼리 연결해주는 선

- Directed VS. Undirected
- Weighted VS. Unweighted


## ㅁ 탐색방법
- Breadth First Search (너비 우선 탐색)
```
Start 하는 Vertex가 주어지면, 그 Vertex 바로 옆 neighbor들을 탐색한다.  
그 후, neighbor의 neighbor들을 탐색한다. 이 과정을 반복하여 불가능할 때 까지 실행하는 것이 알고리즘의 주 방법이다.  
Implement하기 위해서 Queue를 쓰는 것이 일반적이다.
```

- Depth First Search (깊이 우선 탐색)
```
위 BFS와는 다르게, Start 하는 Vertex가 주어지면, 한 neighbor 를 계속 물고 늘어진다.  
이 말인 즉슨, 그 neighbor의 neighbor한개, 그 neighbor의 neighbor한개를 계속 타고 들어가 불가능할 때 까지 타고 들어간다.  
불가능해지면, start vertex 의 neighbor 중 다음 neighbor에 대해 위와 같은 작업을 반복한다.  
Implement하기 위해서 Stack을 쓰는 것이 일반적이다.
```


- Minimum Spanning Tree
```
Minimum Spanning Tree(이하 MST)는 Graph가 주어졌을 때 최단 Edge로 모든 Node를 연결하는 Sub Graph를 의미한다.  
예를 들어, ‘한 구역 내 모든 집들을 연결하고 싶은데, 가장 적은 도로들을 사용해서 어떻게 연결 할 수 있을끼?’ 와 같은 문제를 풀 때 기반이 된다.
```

- Shortest Path
```
Shortest Path는 말 그대로 “최단거리”를 뜻한다. 한 장소에서 다른 장소까지 최단거리 경로가 얼마인지를 알아낼 때 Graph를 기반으로 보통 생각하게 된다.  
이 경우, 동적 프로그래밍 방법을 이용해서 Back Tracking 하는 방식으로 풀 수도 있지만, Greedy Algorithm의 일종인 Djikstra(다익스트라)의 알고리즘이 많이 사용된다.  
```



<br>

## ㅁ Source
- Raywenderlish - Data Structures & Algorithms in Swift (iBooks)
- Hello Coding 그림으로 개념을 이해하는 알고리즘 책 - Chap. 6
- 탐색방법 참고 사이트 : https://devdoggo.netlify.com/post/alg_ds/graph/
