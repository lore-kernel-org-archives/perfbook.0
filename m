Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=RRoXSiIgXu5ZFpY3GAavDtydBymKSi1cLDVK2h8t3F0=;
 b=HbxhO7slcE02xuC8M4PLPKDHAV6vC1d60n+AMXf+dFHvpPle5ZKbtR9r8tCV0lJYbS
 8XQB4hOn5RUG2ernaHkXBMiviyhlSsct33//lvq9hS3Ach0prd6ddnFefba8bje0JwKO
 TV3nCwVtyp5/ITNxG8OINmV89Jl3cjFa1cK+PdpK9tPaZXCtxfd/UfeFnqqVonY7eGwc
 s8E06eUHFUjAIDuNyclFvjd/uNjaiF8caFoknvJQgsXJPcl+WgTv6ICYBoU0TMsG6pQG
 OgMpnVC8Lt8ck1kKJ2jvjiXD+r8xKt4VA1+kPUSIuyR9nm6mHpcL0VZK4kMuM02F4Ils
 GrOw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Julia language
Message-ID: <31ffe8fa-8787-7554-ce37-285cb0961a26@gmail.com>
Date: Fri, 17 Nov 2017 00:43:19 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

Have you heard of "Julia" language?

JFYI,
As can be seen in its official page at https://julialang.org/ and a Wikipedia
article at https://en.wikipedia.org/wiki/Julia_(programming_language),
it looks like one of promising answers to perfbook's Section 2.2 "Parallel
Programming Goals".

As long as high-performance number crunching is concerned, it claims to have
comparable performance to C, with a programming productivity much better
than C + MPI.

Note: I'm not a user of the language at the moment. I just heard of it at
a twitter hashtag #julialang.

I'd like you to check it up and (hopefully) update the above mentioned
section in perfbook.

      Thanks, Akira

