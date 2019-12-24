Return-Path: <SRS0=MNcj=2O=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/6i3ipu4zFMZSmcpOpUNXjWfy1UJUkBgq966sSDuZ44=;
        b=tEyOuKmE9yAoGTEUD713IfP9IzVbPyC3HsW29ybZY9Z9uYl5v8Mmtoi7R4yu5pryaM
         KzJXcfhR5QIIWTETTvBDMfabWYLA7SpPv5Qp63vb7NfBFvzGrqv9gdShDq+5/ES5lz0V
         MOy8sTaCJBZwFIeqA+452HIo2Rt1py2Wr3if4nuDjWjnIGdcIov4JLDuXN15U4XIWQrm
         9YAXBLsJ0Bh911TIoahE/cNuI9c6DharV1QHXO9lx9VD8TjxFScYQoY6arJnjF1Y53V0
         8z0jo4DcXiOoVHxpJY/nHAyV7RNVY2pCVa1aI+kVM4P56m57v+yJ39CQfJSIcg0Hp8jH
         TgLQ==
Subject: Re: [PATCH v2] utilities/autodate: Restore compatibility with bash
References: <f9c54c72-db80-f29e-76c5-2d36c02c183a@gmail.com>
 <b9691f42-5edb-d57f-3a11-d6ce7a7b930e@gmail.com>
 <20191224172432.GI13449@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <863f2ca9-5c1b-d4f9-ceca-94f92cdb7e74@gmail.com>
Date: Wed, 25 Dec 2019 07:04:46 +0900
MIME-Version: 1.0
In-Reply-To: <20191224172432.GI13449@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Tue, 24 Dec 2019 09:24:32 -0800, Paul E. McKenney wrote:
> On Mon, Dec 23, 2019 at 08:55:08PM +0900, Akira Yokosawa wrote:
>> >From 43bf4cc57125d756ccd14b629692c4ecdb5c36dc Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Mon, 23 Dec 2019 20:52:46 +0900
>> Subject: [PATCH v2] utilities/autodate: Restore compatibility with bash
>>
>> Also improve uses of single quotes (without escaping) and
>> double quotes (with escaping) in the script.
>>
>> Fixes: 650f763c31e8 ("utilities/autodate: Mark released versions")
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>> ---
>> Changes in v2:
>>
>>     o Modified title
>>     o Tested with both "dash" and "bash" as /bin/sh
>>
>>         Thanks, Akira
> 
> It does work here, queued and pushed, thank you!
> 
> In other non-urgent news, arxiv does not like "@" in filenames (see below
> for its complaints).  It -looks- like it is possible to make these instead
> be "=" by changing the 's/:/@/g ;' instances in utilities/gen_snippet_d.pl
> to 's/:/=/g ;', and then changing the pathnames containing "@" in the
> various .tex files to "=".  

I'm not sure if targets in Makefile can contain "=".
Another approach would be to do the renames and substitutions on-the-fly
in toarxiv.sh.  Thoughts?

        Thanks, Akira

>                             But I figured I should check with you before
> breaking something.  (If it was urgent, I would try it anyway, but I have
> no problem waiting a few weeks before posting to Arxiv.  Hence my asking
> non-urgently.)
> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
> Attempting to rename lockhdeq@pop_push.fcv to lockhdeq_pop_push.fcv.
> We only accept file names containing the characters: a-z A-Z 0-9 _ + - . , =
> Attempting to rename lockhdeq@struct_pdeq.fcv to lockhdeq_struct_pdeq.fcv.
[...]
