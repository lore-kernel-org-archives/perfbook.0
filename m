Return-Path: <SRS0=zoNZ=LI=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZZx//+aPVswUp/jgrzmAehr229ifNe/1xUdB+d4a3nY=;
        b=l3U7SLE54E4ZPQYIen89Kn4PYLDYPpNc2wwUQxqw/8CkyIqRtiNI7DpLztr9CNO8pF
         I3XWX3lvEXkCgXNvOhx9gVbFLRENlv5hMpdF82yabbwjeyVpHOmEqDierRCh3thrxJfL
         75NHKdVlS75PltTFSY/UNh9099ekLYC7tYTwSxXiIgBEDZX9ZGz66+F0oTMi/NoF6qNY
         7mQWVL7jDOcpxob1jhyPfsRDu9ElHnmvZYAs8gkXwWYVCqaYVoHUi7pdBhuLvXaQ3/RU
         8ck7DzznPO3JcocOYIjqDbAja0UQY3XNHgcczuTHA9jKc84X6U/1SrhdizLG5Ac75wIT
         ZqwQ==
Subject: [PATCH -perfbook 2/2] Fix typos (scalability)
References: <f3899671-ca23-631b-af10-cb20e0bf84d1@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <bbd41fa6-d0f9-0db4-77c1-f83b607f8c7d@gmail.com>
Date: Mon, 14 Jun 2021 13:01:23 +0900
MIME-Version: 1.0
In-Reply-To: <f3899671-ca23-631b-af10-cb20e0bf84d1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 appendix/questions/ordering.tex | 2 +-
 intro/intro.tex                 | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/appendix/questions/ordering.tex b/appendix/questions/ordering.tex
index c3015f73..298600f9 100644
--- a/appendix/questions/ordering.tex
+++ b/appendix/questions/ordering.tex
@@ -16,7 +16,7 @@ the other?
 The answer, as is so often the case, is ``it depends''.
 
 One approach is to construct a strongly ordered system, then examine
-its performance and scalablity.
+its performance and scalability.
 If these suffice, the system is good and sufficient, and no more need
 be done.
 Otherwise, undertake careful analysis
diff --git a/intro/intro.tex b/intro/intro.tex
index b185a7f7..28c0bf50 100644
--- a/intro/intro.tex
+++ b/intro/intro.tex
@@ -934,7 +934,7 @@ However, partitioning the work requires great care.
 For example, uneven partitioning can result in sequential execution
 once the small partitions have completed~\cite{GeneAmdahl1967AmdahlsLaw}.
 In less extreme cases, load balancing can be used to fully utilize
-available hardware and restore performance and scalabilty.
+available hardware and restore performance and scalability.
 
 Although partitioning can greatly improve performance and scalability,
 it can also increase complexity.
-- 
2.17.1


