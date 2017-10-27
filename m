Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;        bh=5bz6F9ara73PMHhfzx1cm35V+Nb0it4A2B0GpXp2pMs=;
 b=CXcLqisnYfTW4tPKxmB/wpdGxiOGCbv7BFIP9Pirs4nO1ZkNtKhK8XydfjvzCtirl3
 T8WweSBQsWizGV9TL5+JS7Ln8GneJKvj+FgR5xrZiFkJhLXjalSZ8lhxwMh8t86OJFph
 UO0VH0leNrADaexeB9PMyMDK0yvbbnEnSX8LQTVkm+1wNeAJ0At6oNIN8aEPCNTqqApj
 uGz1SzAX498SKlSOPpqEg6kIFnbYhMNvrtCcemIXS3yZDqUo6fNtLRsdct8kAzRJIm4+
 RulZGlrB21okfJg3k/Vc/8CPUw3knBJSYD9Jfh46vHCvkUjMwxK9+D1o9t0GsAAG9t94
 2h5w==
Date: Fri, 27 Oct 2017 17:23:19 +0800
From: Yubin Ruan <ablacktshirt@gmail.com>
Subject: [PATCH] typo at Chp 7.
Message-ID: <20171027092317.GA8509@HP>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: perfbook@vger.kernel.org
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
List-ID: <perfbook.vger.kernel.org>

Hi paul,

I finish chapter 7 and find some typo. Fixed in the patch below.

Yubin

diff --git a/locking/locking-existence.tex b/locking/locking-existence.tex
index 9fcbbf9..c7c4ae8 100644
--- a/locking/locking-existence.tex
+++ b/locking/locking-existence.tex
@@ -174,7 +174,7 @@ single partitionable data structure such as the hash table shown in the
 figure, it can be problematic if a given data element can be a member
 of multiple hash tables or given more-complex data structures such
 as trees or graphs.
-These problems can be solved, in fact, such solutions form the basis
+These problems can be solved. In fact, such solutions form the basis
 of lock-based software transactional memory
 implementations~\cite{Shavit95,DaveDice2006DISC}.
 However,

