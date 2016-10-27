Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=+iMHv0Uq2WwheCrcE1D6cnezTnUTOL4fEByO8/8rPM4=;
 b=skubZWu14qWSJZF4Gpa5yKV39HkmogWXHRIFxZPVirwSNYSNqCRF0cH1i7bjYEpLWB
 v9DfEEipPEfuZ+qkn2osrWvIPtgfQ2Am0XX+PsV6JRBYfsYijuB2B30UpVYdzG+d5WkC
 VTjCQAktes4yhrH1uPHui90xVBeeNvpAKFkjWhFYyIuZQhI+WY7u/akxKHIcr2ivnUKB
 5ywM80rav015q3ce4VdxedfWV4xhxMcJJZoMdFjLmW0qL99qLv4bigiQAphHuge69wWa
 tmD97HEJpHi+P14KoueGKLGXxm17VQy5tGPI9W0oGkJk/yfKMoDDfMj/61iIasbUygaC
 XMwg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [Q] url in bibliography
Message-ID: <8d8bb422-0d2c-f905-4f72-bafe6d702af5@gmail.com>
Date: Fri, 28 Oct 2016 00:19:36 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

I have a question regarding your commit 29650119a215 ("Update bibliography").

In the 1st hunk,

> +@unpublished{PaulEMcKennneyToolKitP0232R0
> +,Author="Paul E. McKenney and Michael Wong and Maged Michael"
> +,Title="P0232R0: A Concurrency ToolKit for Structured Deferral or Optimistic
> +Speculation"
> +,month="February"
> +,day="12"
> +,year="2016"
> +,note="\url{http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2016/p0232r0.pdf}"
> +}

you chose the format 'note="\url{http://...}"'.

In the 2nd hunk,

> +@unpublished{HansBoehm2012seqlockC11
> +,author="Hans-J. Boehm"
> +,title="Can Seqlocks Get Along With Programming Language Memory Models?"
> +,Year="2012"
> +,Month="June"
> +,Day="6"
> +,Note="HPL-2012-68"
> +,url={http://www.hpl.hp.com/techreports/2012/HPL-2012-68.pdf}
> +}
> +

you chose the format 'url={http://...}'.

There are other format such as 'note="Available \url{http://...}
[Viewed Month Day, Year]"' in the other part of bibliography.

I'm wondering what is the rule which format to choose in expressing urls.
Could you enlighten me?

                                             Thanks, Akira

