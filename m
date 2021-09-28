Return-Path: <SRS0=EiPI=OS=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JM+me6QkNWPfVXB0Leca+c+az0/BqF5Zpsjii3wMIf0=;
        b=PBcBtRzeCxc1q/fKkBQsnsteeB1OecyOPRlGF2fTipjt3tAMa4LmEEIFiLd8VAAK3m
         SM9oSUuEEHnp0po7mpKZcAKFmqUZGqpn8wvP5bQsxaii+UCX3ubCGX/l6L9uo6cGenck
         9GbErKkDFbdPz2F1ZPjxz6wtwHiSUH4LpjFT8zoPuTei5y57XIBN4lNyUTB2QGiJtmua
         pr08Kk/TajnCcBvoczPCu8HuVhvdmQA99ONqB/UXa8Xg6XQf1wZblgDXURuE65dWyxkH
         uCgs9mJaRf3/hzjeMA3CL0yBC6SjiGEzFI+eEuvN6zL8abBUbKjxwAZQoq4p6rbJamfq
         m3cw==
Subject: Re: [PATCH -perfbook] defer: Make RCUspacetime.svg compatible with
 Inkscape 1.0 and later
References: <a11543f8-194b-2363-dd36-141044bce89b@gmail.com>
 <d28da94e-3e54-e264-5b81-01c1636dbb9f@gmail.com>
 <20210923144150.GF880162@paulmck-ThinkPad-P17-Gen-1>
 <957e369c-9fb1-f615-9b62-c1245d227548@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <d7fb71ca-9f7b-27a1-0c32-30a94962ba6b@gmail.com>
Date: Tue, 28 Sep 2021 23:23:26 +0900
MIME-Version: 1.0
In-Reply-To: <957e369c-9fb1-f615-9b62-c1245d227548@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Fri, 24 Sep 2021 09:25:31 +0900, Akira Yokosawa wrote:
> 
> PS:
> 
> Upcoming ghostscript 9.55.0 (now in rc1 phase) will break a2ping again!
> I'm preparing a patch set to abandon a2ping for good.

Good news!

Ghostscript 9.55.0 was released on September 27:

    https://www.ghostscript.com/doc/9.55.0/News.htm

, and it _works_ with a2ping!
Looks like a regression around bounding-box in Ghostscript has been
fixed since rc1.

Anyway, I'll send a patch series to add an alternative set of
.eps --> .pdf conversion rules after some testing on my side.
It works even with the problematic 9.55.0rc1.

Who knows what could happen when 9.56.0 comes along...

        Thanks, Akira
> 
>>
>> 							Thanx, Paul
>>
[...]
