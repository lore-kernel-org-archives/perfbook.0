Return-Path: <SRS0=56sw=FH=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZKfebzBZdp2GdT7aFAQnoNDnd8pG27Qw50w7WIWi5og=;
        b=S4Z0VLVICcrBe6wOfJk0hUIi/F3iExjb221LDX4NLHvvyCMj/ThNrlRqj+fYbPKF4F
         T8iXDtwSulDcx3WJp9YaEQOzkN/yzD/sRYzZH5VpfOTneMAyvOpRhcRUEUqXsXZrbT/G
         loLulFnJTw9CgU149BKUqDknWliAFV5y9nn7wUGl8wtwIZQAJ5IZMJdl2izKKTwcP3lW
         pVo6KTZNxT7dna6Dh32WyQLoiV8KOAo9Dzrb0rAb2k5qJArYMXDXKnSF7Ik+CXNn+Wk1
         lfnnA/FeEXgICEmxVc9LkIMp1XyVQm733MiK0sKPriTuFGPH97pvIxBVfvMNQGxq45O8
         ehCg==
Subject: Re: [PATCH -perfbook] whymb: Fix description of compiler mischief
References: <99ea974f-8788-c2e5-5544-e7e708ad2553@gmail.com>
 <CAGfuzXRydh2x5pmqs-heL8wqmDSiV6XYFyyBXHK2+1Z4UPF27w@mail.gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <11990cae-c6d8-ec5a-530d-75d3063f1ac3@gmail.com>
Date: Thu, 3 Dec 2020 22:38:30 +0900
MIME-Version: 1.0
In-Reply-To: <CAGfuzXRydh2x5pmqs-heL8wqmDSiV6XYFyyBXHK2+1Z4UPF27w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Motohiro Kanda <kanda.motohiro@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Thu, 3 Dec 2020 20:04:56 +0900, Motohiro Kanda wrote:
> Hi, all
> 
>> Motohiro, do you mind if I submit patches to Paul on behalf of
> 
> Certainly, please submit patches.

Glad to hearing from you, Motohiro!
Can I take it as your Acked-by?

> 
> While I was working on Japanese translation, I felt something odd with this
> smp_mb sample code, but I did not report one to upstream because I was
> not so sure.
> I just left a comment on my translation.
> 
> It is my great pleasure that someone reads my translation so seriously, Akira.

I'll keep picking up comments in your translation and submitting
patches upstream based on them.

Some background:

I was tempted to do translation on my own when I first encountered
perfbook, but seeing what you had done at the time (2015 or 2016),
I changed my mind and started contributing to perfbook as a LaTeX advisor.
The rapid update pace of upstream perfbook was another factor I
changed my mind.
At that time your translation was work-in-progress, but last weekend,
I was impressed to find out it is mostly complete.

If there is anything I can't understand in your comments, I'll ask
you in person (in Japanese maybe).

        Thanks, Akira

> 
> Thanks again for great book, Paul and others!
> 
> --
> Motohiro Kanda
> 
[...]
