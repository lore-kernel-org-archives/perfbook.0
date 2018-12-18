Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=U6+v+tWdol7E118OgCk8X/vwqBsD/4+zeuuadlN7gtE=;
        b=G80694CJcc60tn32VMHuJYD3XDYJt/8nk7T5iupJJuG8mg3fO6/QGUQJaRyhOO+P6M
         vcY9VqjLOfjHnWe81puz/NKaExcLJ5uIHQRA0QuR6y1lTL1+yFUIfGEhCcmV6i3cnn8Z
         Y9vVucpDlxqm9J7bWxy2PUq6IE8R5MoTs8RraCTIh57qTDqpIiR4cRKvacDpdR3VJINn
         ++KEoNHNQg72B+xnq7nzrgUkdvtwIbqmDBMkAKJ9J5LfFcCkntq9A4zt7g0/679Ns1oR
         q8tIoSpslVMpDOxtT4A2LOYjALPBQFmiXjwufKMknrfo7xHwK87dsiEj3skCQPDD8YzS
         z8dA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/2] Update code snippets in QQA of defer/rcuapi
Message-ID: <b34039b3-cf06-ef01-8021-c6839934dbeb@gmail.com>
Date: Wed, 19 Dec 2018 00:01:07 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 3908668ab195e3b0b230eb7a667b03009107ca24 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 18 Dec 2018 23:38:18 +0900
Subject: [PATCH 0/2] Update code snippets in QQA of defer/rcuapi

Hi Paul,

Let's resume updating snippets.

Patch #1 updates a couple of snippets in QQA of defer/rcuapi.tex
which I missed prior to the latest release.

Patch #2 is an independent fix to avoid duplicate entries in
bibliography.

It turned out that update of code snippets in datastruct
requires some enhancement of fcvextract.pl to handle labels of
the form "/* \lnlbl{foo} */".
Also, code samples under CodeSamples/datastruct/ have quite
a few comment blocks, which should not appear in the resulting
code snippets. Putting \fcvexclude for those comment lines would
cause the code samples look ugly, so fcvextract.pl should be able to
remove them automatically.

I'll submit the update in datastruct once the update of the script
becomes ready.

        Thanks, Akira
--
Akira Yokosawa (2):
  defer/rcuapi: Employ new scheme for snippets in Answers to Quick
    Quizzes
  memorder: Avoid citing duplicate bib entries

 defer/rcuapi.tex      | 51 +++++++++++++++++++++------------------------------
 memorder/memorder.tex |  2 +-
 2 files changed, 22 insertions(+), 31 deletions(-)

-- 
2.7.4

