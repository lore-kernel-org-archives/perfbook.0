Return-Path: <SRS0=yiAp=RH=gmail.com=e2lahav@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=I8AWDaup1WPtmNWl91kA/Y8d5r7cTyfsv58zFE0rmF8=;
        b=M6wMmxToCLuAx10N73/Vk31PD7gsDwyWDn4gDQ4NRck7XXo/T0uOyLCb+WYNxEtYl+
         4hwFdn7zIEPhAme93tSVf1UBlssBH6qIU2c5nhz2TIbkdu2c9urFhQHB7bjtBWH4QREV
         dpws3wwYyzao+K2Ic1MTcHRDK5muEgG7nnnsr/xrfMFgqy1VLk79PAwJExYdhtW45Hpp
         o0j02NCihU3xSxuIjKh8wZflBGt3RfYBY9NhI821EYSHu7gTAUA6vNdjYmNqVJPkGC0l
         SEuCXH5VbuXnwNOaZtxs1TD4H1F9rLJLeJg1sCfHMJshjwpO2XSgYqzFeLRClGcHFJYl
         cGQQ==
Subject: Re: Section 9.5: Nobody expects the Spanish Acquisition!
References: <CAJbg=FWZG2EicBGKBbVzYnhH7oT3FqkwY738pmra9G9riGssVQ@mail.gmail.com>
 <b2851e07-d804-eff9-cb48-c636a159f868@gmail.com>
From: Elad Lahav <e2lahav@gmail.com>
Message-ID: <4f0ee3e7-73dc-9a76-0272-c49c2f09ccbc@gmail.com>
Date: Wed, 22 Dec 2021 07:15:54 -0500
MIME-Version: 1.0
In-Reply-To: <b2851e07-d804-eff9-cb48-c636a159f868@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>
List-ID: <perfbook.vger.kernel.org>

Hi Akira,

> I think this is mostly covered in Section 9.5.2.1 "Publish-Subscribe
> Mechanism" and Figure 9.10 "Publication/Subscription Constraints".

I don't believe it is. I think you can infer that from reading sections 
9.5 and chapter 15, but it is never made explicit.

Sub-section 9.5.2.1 talks about the use of rcu_dereference() to obtain a 
pointer, but it doesn't go very deep into how that's implemented. You 
would think that the writer's use of store-release semantics would 
necessitate the reader's use of load-acquire semantics, but the 
discussion here, the previous examples, and a quick inspection of how 
rcu_dereference() is implemented, suggest that a READ_ONCE() is 
sufficient (or some less Linux-kernel-specific equivalent).

If I am a naive reader (and a lazy one, who haven't read chapter 15 and 
made the necessary connection), I could write something like:

     struct foo_s {
         int a;
     } foo;
     int b;
     struct foo_s *g_foop = &foo;

     // Reader
     rcu_read_lock();
     struct foo *l_foop = rcu_dereference(g_foop);
     use(l_foop->a);
     use(b);
     rcu_read_unlock();

     // Writer
     struct foo *l_foop = malloc(sizeof(struct foo));
     l_foop->a = 1;
     b = 2;
     // Release semantics ensure previous stores are observed
     rcu_assign_pointer(g_foop, l_foop);

But since b has no address dependency to g_foop and since neither 
rcu_read_lock() nor rcu_dereference() impose acquire semantics, then the 
reader may not observe the new value of b.

Again, I may be missing something, but this seems to be a major point 
that needs to be explained and emphasized.

> BTW, I couldn't figure out what you meant by "the Spanish
> Acquisition"...
It's a reference to an old Monty Python skit. Apologies for the silly pun...

--Elad
