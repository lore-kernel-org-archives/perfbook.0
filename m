Return-Path: <SRS0=Xi1B=EE=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692403605; x=1693008405;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lamxORGfCwvd9vhLKt7PYzjvx7yT+F+0rDzxtbunxcM=;
        b=Z9l6oEJtLuafPF1fsizHCayZ74sEVfDXe6tzHNIq04oAKNeKhmJIPr5d8DXf9pHenO
         0hn5Im/zxc5RGvvsfFpHhxc+mnsDjo/jrYL/MCNFRwuNEnX321UIqbMFxgiCCkQ44DuW
         cMUv4EQuviGu9dLNJTE8RUlrh0rJvzFlXiK4IXnYC0osfcYjXy8mGUOLcKurJrMeV0Fz
         H8v1Km7hhCcXZdJ2M3yieuusftN0u/tUCi/qXsEb5N1heAhoZQKj+GTkIhc6y9T2MfBN
         ASWZDVlTxO6oUxgN0DVCz/JA7mMQJhdkJtSo1GWMUMPuDqWOMqBph4TKhoZ25yYhWGxC
         RXGg==
Message-ID: <04989c09-1c98-0a46-6237-86f51dd77d72@gmail.com>
Date: Sat, 19 Aug 2023 09:06:42 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 2/2] Use \raggedbottom for ebook-size builds
Content-Language: en-US
References: <bcfc8abd-05e4-2700-982e-e0cbd401fc1a@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <bcfc8abd-05e4-2700-982e-e0cbd401fc1a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

\flushbottom, which is the default of book class, is suited for
typesetting double-sided printed documents.

For ebook-size builds, which is one-sided, \flushbottom doesn't
make much sense.  \raggedbottom should be a better option as it
prevents excessively tall vertical stretches between paragraphs and
elsewhere.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook-lt.tex | 1 +
 1 file changed, 1 insertion(+)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index fdfde1953225..9c89dd4254b8 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -603,6 +603,7 @@
 \renewcommand{\epigraph}[2]{\epigraphorig{\biolinum\emph{#1}}{\biolinum\scshape\footnotesize #2}}
 \IfEbookSize{
   \newcommand{\Epigraph}[2]{\epigraph{#1}{#2}}
+  \raggedbottom
 }{
   \newcommand{\Epigraph}[2]{\epigraphhead[65]{\epigraph{#1}{#2}}}
 }
-- 
2.25.1


