# BatchPDFSign


![Maven Package](https://github.com/jmarxuach/BatchPDFSign/workflows/Maven%20Package/badge.svg)
![Java CI with Maven](https://github.com/jmarxuach/BatchPDFSign/workflows/Java%20CI%20with%20Maven/badge.svg)


Command line tool for digital signature of PDF files, useful for example in Batch processes, from non Java programming languages like Php, Shell scripts, etc...
 
BatchPDFSign is a command line to sign PDF file with a PKCS12 certificate.

To use it you need: 
- a PKCS12 certificate. It should be a <filename>.pfx or <filename>.p12 file.
- a password for the certificate
- and a PDF file to sign.

## self signed certificate creation
You can create your own self signed certificate with this following 4 commands in Ubuntu.

```bash
openssl genrsa -aes128 -out myself.key 2048
openssl req -new -days 365 -key myself.key -out myself.csr
openssl x509 -in myself.csr -out myself.crt -req -signkey myself.key -days 365
openssl pkcs12 -export -out myself.pfx -inkey myself.key -in myself.crt
```

## Signing
### Synopsis
```
usage: BatchPDFSignPortable
 -i,--input <arg>      input file path
 -k,--key <arg>        key file path
 -o,--output <arg>     output file
 -p,--password <arg>   keyfile password
    --page <arg>       page of signature rectangle; needs to be specified
                       to output signature rectangle
    --fs <arg>         font size of text in signature rectangle (default:
                       12); needs --page to be specified as well
    --rh <arg>         height of signature rectangle; needs --page to be
                       specified as well
    --rw <arg>         width of signature rectangle; needs --page to be
                       specified as well
    --rx <arg>         x position of signature rectangle; needs --page to
                       be specified as well
    --ry <arg>         y position of signature rectangle; needs --page to
                       be specified as well
    --signtext <arg>   signature text; needs --page to be specified as
```

### key file path
This parameter is the certificate you want to sign the pdf with. It can be generated with the code documented in the chapter self signed certificate creation.

### password
This parameter is the password for the certificate. The password is set during the creation of the certificate file.

### input file path
The file you want to sign.

### output file
If this parameter is set, a new file with this name will be created and signed. The original file will remain untouched.

### visible signature
By default, the signature will not be (easily) visible in the final PDF file. If you want to make it easier for users to see, and with that and some GUIs easier to check the signature, you have to specify the location and size of the "signature rectangle". You also have the option to change the font size and to specify your own text.

- --page
    this option is required if you want the signature to appear. If you give this option, you will also have to specify --rx, --ry, --rw and --rh.
- --rx and --ry
    specify the location of the signature rectangle
- --rw and --rh
    specify the width and height of the signature rectangle
- --fs
    specify the font size of the text within the signature rectangle; 12 by default
- --signtext
    override the standard text provided by the signature-library with your own, provided text

## Development
You'll need:
- Maven
- Java 8 JDK

That's all folks.
PEM pass phrase: axiell
pass phrase for arena.key: axiell
Common Name (e.g. server FQDN or YOUR name) []:Arena
A challenge password []: axiell
Export Password:axiell

/usr/lib/jvm/java-8-oracle/bin/java -javaagent:/opt/java/idea/lib/idea_rt.jar=44819:/opt/java/idea/bin -Dfile.encoding=UTF-8 -classpath /usr/lib/jvm/java-8-oracle/jre/lib/charsets.jar:/usr/lib/jvm/java-8-oracle/jre/lib/deploy.jar:/usr/lib/jvm/java-8-oracle/jre/lib/ext/cldrdata.jar:/usr/lib/jvm/java-8-oracle/jre/lib/ext/dnsns.jar:/usr/lib/jvm/java-8-oracle/jre/lib/ext/jaccess.jar:/usr/lib/jvm/java-8-oracle/jre/lib/ext/jfxrt.jar:/usr/lib/jvm/java-8-oracle/jre/lib/ext/localedata.jar:/usr/lib/jvm/java-8-oracle/jre/lib/ext/nashorn.jar:/usr/lib/jvm/java-8-oracle/jre/lib/ext/sunec.jar:/usr/lib/jvm/java-8-oracle/jre/lib/ext/sunjce_provider.jar:/usr/lib/jvm/java-8-oracle/jre/lib/ext/sunpkcs11.jar:/usr/lib/jvm/java-8-oracle/jre/lib/ext/zipfs.jar:/usr/lib/jvm/java-8-oracle/jre/lib/javaws.jar:/usr/lib/jvm/java-8-oracle/jre/lib/jce.jar:/usr/lib/jvm/java-8-oracle/jre/lib/jfr.jar:/usr/lib/jvm/java-8-oracle/jre/lib/jfxswt.jar:/usr/lib/jvm/java-8-oracle/jre/lib/jsse.jar:/usr/lib/jvm/java-8-oracle/jre/lib/management-agent.jar:/usr/lib/jvm/java-8-oracle/jre/lib/plugin.jar:/usr/lib/jvm/java-8-oracle/jre/lib/resources.jar:/usr/lib/jvm/java-8-oracle/jre/lib/rt.jar:/opt/playground/java/BatchPDFSign/portable/target/classes:/home/wos/.m2/repository/commons-cli/commons-cli/1.3.1/commons-cli-1.3.1.jar:/opt/playground/java/BatchPDFSign/lib/target/classes:/home/wos/.m2/repository/commons-io/commons-io/2.7/commons-io-2.7.jar:/home/wos/.m2/repository/com/itextpdf/barcodes/7.2.0/barcodes-7.2.0.jar:/home/wos/.m2/repository/com/itextpdf/font-asian/7.2.0/font-asian-7.2.0.jar:/home/wos/.m2/repository/com/itextpdf/forms/7.2.0/forms-7.2.0.jar:/home/wos/.m2/repository/com/itextpdf/hyph/7.2.0/hyph-7.2.0.jar:/home/wos/.m2/repository/com/itextpdf/io/7.2.0/io-7.2.0.jar:/home/wos/.m2/repository/com/itextpdf/commons/7.2.0/commons-7.2.0.jar:/home/wos/.m2/repository/com/itextpdf/kernel/7.2.0/kernel-7.2.0.jar:/home/wos/.m2/repository/com/itextpdf/layout/7.2.0/layout-7.2.0.jar:/home/wos/.m2/repository/com/itextpdf/sign/7.2.0/sign-7.2.0.jar:/home/wos/.m2/repository/com/itextpdf/styled-xml-parser/7.2.0/styled-xml-parser-7.2.0.jar:/home/wos/.m2/repository/com/itextpdf/svg/7.2.0/svg-7.2.0.jar:/home/wos/.m2/repository/com/itextpdf/pdfa/7.2.0/pdfa-7.2.0.jar:/home/wos/.m2/repository/org/bouncycastle/bcpkix-jdk15on/1.68/bcpkix-jdk15on-1.68.jar:/home/wos/.m2/repository/org/bouncycastle/bcprov-jdk15on/1.68/bcprov-jdk15on-1.68.jar:/home/wos/.m2/repository/org/slf4j/slf4j-api/2.0.0-alpha1/slf4j-api-2.0.0-alpha1.jar:/home/wos/.m2/repository/org/slf4j/slf4j-simple/2.0.0-alpha1/slf4j-simple-2.0.0-alpha1.jar BatchPDFSign.portable.Main --input Agreement.pdf --output Agreement-signed.pdf --key arena.pfx --password axiell --page 1 --rh 300 --rw 500 --rx 100 --ry 0 --signtext "Hereby I Wojciech Syski accept the above Library Terms and Conditions"

https://stackoverflow.com/questions/51190748/how-to-create-a-pkcs12-keystore-with-privatekey-encryption-pbewithhmacsha512anda
