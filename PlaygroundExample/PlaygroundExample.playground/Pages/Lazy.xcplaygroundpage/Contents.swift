import Foundation

struct NameLabel {
    var name: String
    lazy var lazyLabelContent: LabelContent = {
        return LabelContent(self.name)
    }()
    
    var computedLabelContent: LabelContent {
       return LabelContent(self.name)
    }
    
    init(_ name: String) {
        self.name = name
    }
}

struct LabelContent {
    var content: String
    
    init(_ name: String) {
        print("\(name)'s LabelContent initialize ")
        self.content = "Hello My Name is \(name)"
    }
}

var lazyNameLabel = NameLabel("Kim Cook")
print(lazyNameLabel.lazyLabelContent)
lazyNameLabel.name = "Cook Kim"
print(lazyNameLabel.lazyLabelContent)
print("====================================")
var computedNameLabel = NameLabel("Kim Cook")
print(computedNameLabel.computedLabelContent)
computedNameLabel.name = "Cook Kim"
print(computedNameLabel.computedLabelContent)
