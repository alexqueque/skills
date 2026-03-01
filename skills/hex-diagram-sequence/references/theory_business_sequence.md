# Business Sequence Diagram Theory (业务序列图理论)

Based on the Hex methodology (潘加宇《软件方法》), here are the core principles for constructing high-quality business sequence diagrams.

## 1. Messages are Responsibilities, not Data Flow (消息代表责任分配而不是数据流动)
In a sequence diagram, a message from A to B means "A requests B to do something" (A调用B的服务). It maps to B's responsibility. Data flow is merely parameters of these messages. Do not draw a message just because data is passed.

## 2. Correct Abstraction Level (抽象级别是系统之间的协作)
The research target in business modeling is the Organization. The lifelines must be systems (either Human systems/roles or Computer systems).
- **DO NOT** draw database tables, software components, or UI elements on the lifeline.
- **DO NOT** draw non-intelligent objects (like a paper form or a pen) on the lifeline. They are passed as parameters in messages.
- For example, a worker doesn't use "Word" to write a spec. A worker writes a spec (using Word). If Word is irrelevant to the core domain, don't draw it.

## 3. Time as a Special Entity (把时间看作特殊的业务实体)
If a process is triggered periodically or at a specific time, model "Time" (时间) as a Business Entity that sends a message to trigger the process. Do not use "Timer" (定时器) as an actor.

## 4. Avoiding Mistakes in Current State Modeling (现状业务序列图的常见错误)
- **Do not mix imagined improvements into the current state** (把想象中的改进当成现状).
- **"Current State" is not "Pure Manual"** (把"现状"误解为"纯手工"). The current state includes all currently used software and tools.
- **"Current State" is not "Before we arrived"** (把"现状"误解为"本开发团队未参与之前").
- **"Current State" is not "The Norm"** (把"现状"误解为"规范"). Model what people *actually* do, not what the rulebook says.
- **No such thing as "I'm innovating, so there is no current state"** (我是创新，没有现状). Every system replaces some existing way of doing things.
- **No such thing as "I'm making a product, there is no current state"** (我做产品，没有现状). Pick a concrete target organization to model.

## 5. Improvement Patterns (改进模式)
When transitioning from the Current State to the Improved State, look for:
1. **Logistics to Information Flow (物流变成信息流)**: Replace physical movement with software.
2. **Improve Information Transfer (改善信息流转)**: Replace humans acting as middle-men between disconnected systems with a unified software system.
3. **Encapsulate Domain Logic (封装领域逻辑)**: Move complex decision-making and calculations from human brains to the software system.
4. **Abu's Thinking Method (阿布思考法)**: Imagine what a billionaire with infinite resources would do, then build a software system that mimics that experience cheaply.
