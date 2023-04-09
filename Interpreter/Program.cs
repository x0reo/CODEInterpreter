using Antlr4.Runtime;
using Interpreter;
using Interpreter.Content;

var fileName = "Content/test.ci";

var fileContents = File.ReadAllText(fileName);
var inputStream = new AntlrInputStream(fileContents);
var codeLexer = new CODELexer(inputStream);
var commonTokenStream = new CommonTokenStream(codeLexer);
var codeParser = new CODEParser(commonTokenStream);
var codeContext = codeParser.program();
var visitor = new CodeVisitor();

visitor.Visit(codeContext);
