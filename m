Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=eNKi9Zy09FkW10efHPwgzsa57qk2fMVCjMnwTQ2v2Rw=;
 b=YdzQ+1UlVy5Afw5a9TrezAgMkExWVYyCNgAF6NQ1oWrHMGrncxo9dwUHWmHf/kozNJ
 SnhMVUKN8IGCMqnZvvfZCeJq7hOQigS6VpkwxfgOxGuI7J93HtogHhAe8G6L+nF1iD48
 lcK/mv3gmyuAZvPuDObQQXHFrnCEWhudlRRSJcb/wAxiH3KCiZo7T1QNs1wFxS3MGqsv
 3/UbimPDmF5+pb8clMLxL1Ols37BvYHmwmtyWsB9Ny7uI/Qq+bF83G79Kea/vSPiMANM
 5GnLfarllM9wjYXXgW+9igIwSPmsrYSZ16aqR7G5KgwGUuG057cyt4gJVUT8ln3i/ejN
 M+Tg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Is WRITE_ONCE() enough to prevent invention of stores?
Message-ID: <9307038d-60f1-0c93-55a1-f3c9be35605c@gmail.com>
Date: Sat, 16 Sep 2017 20:01:45 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

I'm a bit disturbed by the description in Section 14.3.1 "Memory-Reference
Restrictions" quoted below:

> Oddly enough, the compiler is within its rights to use a variable
> as temporary storage just before a store to that variable, thus
> inventing stores to that variable.
> Fortunately, most compilers avoid this sort of thing, at least outside
> of stack variables.
> Nevertheless, using WRITE_ONCE() (or declaring the variable
> volatile) should prevent this sort of thing.
> But take care: If you have a translation unit that uses that variable,
> and never makes a volatile access to it, the compiler has no way of
> knowing that it needs to be careful.

I'm wondering if using WRITE_ONCE() in a translation unit is really
enough to prevent invention of stores.

Accessing via a volatile-cast pointer guarantees the access is not
optimized out (and hopefully the referenced value is respected).

But I suspect that it has any effect in preventing invention of extra
loads/stores.

Isn't declaring the variable volatile necessary for the guarantee?

In practice, as is described in the above quote: "Fortunately, most
compilers avoid this sort of thing, at least outside of stack variables",
we can assume non-volatile shared variables are not spilled out to
the variables themselves as far as GCC/LLVM is concerned.
But this is compiler dependent, I suppose.

      Thanks, Akira

