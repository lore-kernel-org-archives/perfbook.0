Return-Path: <SRS0=qnUg=4J=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/PPfCGH9k46iaZz4Gbbsk43TePdmO+9eDeURZEyCIL0=;
        b=CYdjRsEI9gbo9V4nV4N1t9OsLb9DTd/3wLOzOyxpUOOD1e2bble9iBPGZSA9c4++Qi
         qOkVIxkN9rwF48UJ6RiylwR1xlB5eXJT8SRRlR4XDNRHbh1cK5F3RNFqYw/n9/JFWJ/n
         LThGmD+UWvYPfHsWCsNalel6kNmPuj2sAWosRoMrZGZKDtak+t5gyX4fzCbyHvQEr8iF
         lEeSiMi5rYPEKDhzwjAz/9QIahlxf/UefFbxa/mvFiBA1dVvrhjxUtae5aI5u2SJOWao
         vuhcmAMUcZ7l8cMB5qZRHznwu/MJ4Zd5EpDdnxysGAXwBU8+54vh/CpRlo3YJnL+Hy7c
         rzrw==
Message-ID: <53062ca0-0fe0-8cb3-5758-c77a010b8776@gmail.com>
Date: Sun, 11 Dec 2022 21:34:20 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] Load amsmath before fvextra (for lineno v5.0)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

LaTeX package lineno v5.0 incorporated patching of amsmath code
for compatibility. (Pre-v5.0 lineno needs a separate package
linenoamsmath --- now obsolete --- for such compatibility.)
This introduced the ordering requirement that lineno needs to be
loaded after amsmath [1].

In perfbook, lineno is required by fvextra and amsmath is required
by glossaries which is again required by glossaries-extra.
Hence lineno is loaded before amsmath and causes a fatal error with
lineno v5.0.

As a workaround, explicitly load amsmath before fvextra.

Link: [1] https://github.com/latex-lineno/lineno/issues/5
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi,

Having seen no response from lineno's new maintainer for a couple
of days, let's go forward and apply this otherwise harmless change
in our preamble.

        Thanks, Akira
-- 
 perfbook-lt.tex | 1 +
 1 file changed, 1 insertion(+)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 80e36084ed3b..d5383f07c5a6 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -55,6 +55,7 @@
 \usepackage{pifont} % symbols for qqz reference points and carriagereturn
 \usepackage{gensymb} % symbols for both text and math modes such as \degree and \micro
 \usepackage{verbatimbox}[2014/01/30] % for centering verbatim listing in figure environment
+\usepackage{amsmath} % lineno v5.0 (loaded via fvextra) needs amsmath in front
 \usepackage{fancyvrb}
 \usepackage{fvextra}[2016/09/02]
 \usepackage[bottom]{footmisc} % place footnotes under floating figures/tables

base-commit: 4b38d9da63b7a90bcd2046df249b406bb465f5bd
-- 
2.25.1

