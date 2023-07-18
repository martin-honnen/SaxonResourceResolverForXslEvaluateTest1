package org.example;

import net.sf.saxon.s9api.*;

import javax.xml.transform.stream.StreamSource;
import java.io.File;
import java.io.StringReader;

public class Main {
    public static void main(String[] args) throws SaxonApiException {
        Processor processor = new Processor();

        processor.getUnderlyingConfiguration().setResourceResolver(resourceRequest -> {
            if (resourceRequest.relativeUri.equals("doc1.xml"))
            {
                return new StreamSource(new StringReader("<root><test>This is a test.</test></root>"), "doc1.xml");
            }
            else {
                return null;
            }
        });

        XsltCompiler xsltCompiler = processor.newXsltCompiler();

        XsltExecutable xsltExecutable = xsltCompiler.compile(new File("documentPoolTest1.xsl"));

        Xslt30Transformer xslt30Transformer = xsltExecutable.load30();

        xslt30Transformer.callTemplate(null, processor.newSerializer(System.out));

        System.out.println();

        xsltExecutable = xsltCompiler.compile(new File("exposeXslEvaluate.xsl"));

        xslt30Transformer = xsltExecutable.load30();

        xslt30Transformer.callFunction(new QName("http://example.com/mf","eval"), new XdmValue[] { new XdmAtomicValue("doc('doc1.xml')")}, processor.newSerializer(System.out));

        System.out.println();

        xsltExecutable = xsltCompiler.compile(new File("exposeXslEvaluateSaxonEE12ForHE.xsl.sef"));

        xslt30Transformer = xsltExecutable.load30();

        xslt30Transformer.callFunction(new QName("http://example.com/mf","eval"), new XdmValue[] { new XdmAtomicValue("doc('doc1.xml')")}, processor.newSerializer(System.out));

    }
}