Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44844 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728252AbeJ0XiR (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 27 Oct 2018 19:38:17 -0400
Received: by mail-pf1-f193.google.com with SMTP id j2-v6so1913535pfn.11
        for <perfbook@vger.kernel.org>; Sat, 27 Oct 2018 07:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SrZ6mZOVdiBgK6AX1UjDSHyR5xGV8naAwZfn6MKOXhE=;
        b=rxwAV5WUX8b8IF4+GiL1MhD47TDzpUPEVGv75NFhq4iiFca5PQvNJn0RuFE5t4DpkF
         VL00DGdsPq0CPTxfkxYB9o65ff0f7WrHXRvnEJaljC0KKBlFxOfj5RB83YZpGzT5GL1A
         lEUFVIGQwvF63rD9lo7gSEmi/Sm8q8Sa2ucXhJgfvIyKdHVjKa7LrgRTDksYi4h862OV
         TKrPzxozViRaXENIc5TqbFKFgbetLj+tLZgM7kOrp4zv62YmD+QdNZy1MdoZXgyxG1Nq
         zbvf5r0ArieVKrIQl7AayMVF1XukWbx1L52edcuYwBT6Ib/0Lv+FHh4BeCNZLiigz79q
         iTrQ==
Subject: Re: [Possible BUG] count_lim_atomic.c fails on POWER8
References: <d6abdc9c-9d0e-9435-05be-85a4fe9d3347@gmail.com>
 <20181020163648.GA2674@linux.ibm.com>
 <CABoNC80CeE8XsQMHAO-GrSuUQ86z7Z6frm04XUWNbxWtkmKsNA@mail.gmail.com>
 <073797d5-67f7-7426-f895-8004428a84ab@gmail.com>
 <CABoNC828mNgvvqcUm65d+PFdBVB1Pp6FzEyXniPbxo-dUeLxpw@mail.gmail.com>
 <20181025094516.GO4170@linux.ibm.com>
 <CABoNC81fnRn3H3wB+Zx7WG7QPw7qLa13pVcUzxQ-zdX3vtaxuA@mail.gmail.com>
 <444c8f09-b9b3-9564-2418-a7c93198f2e7@gmail.com>
 <ca3f5f62-be71-7cd0-c251-1c544a8170ca@gmail.com>
 <CABoNC80D9bO6bXi5YfOAA6dJzUEwObHKuYihS5P0-9DdOaK0GQ@mail.gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5c2c8a25-cc15-d262-34fc-ae5eb1f5d6f6@gmail.com>
Date: Sat, 27 Oct 2018 23:56:54 +0900
MIME-Version: 1.0
In-Reply-To: <CABoNC80D9bO6bXi5YfOAA6dJzUEwObHKuYihS5P0-9DdOaK0GQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Junchang Wang <junchangwang@gmail.com>
Cc: Paul McKenney <paulmck@linux.ibm.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

On 2018/10/26 08:58:30 +0800, Junchang Wang wrote:
[...]
> 
> BTW, I found I'm not good in writing C macro (e.g., cmpxchg). Do you
> know some specification/document on writing C macro functions in
> Linux?

Although I'm not qualified as a kernel developer,
Linux kernel's "coding style" has a section on this. See:

https://www.kernel.org/doc/html/latest/process/coding-style.html#macros-enums-and-rtl

In that regard, macros I added in commit b2acf6239a95
("count: Tweak counttorture.h to avoid segfault") do not meet
the style guide in a couple of ways:

    1) Inline functions are preferable to macros resembling functions
    2) Macros with multiple statements should be enclosed in a do - while block
    3) ...

Any idea for improving them is more than welcome!

        Thanks, Akira 

> 
> Thanks,
> --Junchang
> 
[...]

