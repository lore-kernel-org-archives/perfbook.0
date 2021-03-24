Return-Path: <SRS0=LEX/=IW=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cE6oUUvpQjIpwkJNn8YSoxw6MqDvUmYTQVIJBoSYdsU=;
        b=j15i7ua9YQBXbzt2tjOjYUyCniXMjGEz0MfHAKmet9FLqXD1urnxh29qauJaGFzuY6
         dkNvxEUHtvU8avYwf+i26kzHJ9Dc/9WEwAaQY1TO7tVeUpUqv8KiUMyIlv0CbNv44vvD
         C4sz1yZAMU5c6+XmOkZMWvJM7Y1z/Skv0AqaHimgq+7gY2eR1d6FtN3r5TbB3p7rKOEo
         IOIAnZUqUI/kS0slVJkucSbQhCPnvbGyQf4uhbWnT5PyPpbByTErH1sO/CLZ1Pi/53+N
         g+2Tm7WikIfsvQB93he6FDQRAvJdB4Ou0ZAhmmFxFdow2wBVPwM3MdRm2+WVM+1LorcR
         NGEQ==
Subject: Re: [RFC PATCH] perfbook/papersize: ebook reader size support
References: <20210323010153.GH77072@balbir-desktop>
 <20210323052354.GS2696@paulmck-ThinkPad-P72>
 <20210323093822.GJ77072@balbir-desktop>
 <3a81ce2e-3c94-9609-b6a3-e4597425e838@gmail.com>
 <20210324011529.GK77072@balbir-desktop>
 <4b4a3289-9bd3-7f54-8d5b-6722d4d05e2b@gmail.com>
 <20210324072727.GL77072@balbir-desktop>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <fee5bae0-94de-08b6-4555-a84a9de0cefc@gmail.com>
Date: Wed, 24 Mar 2021 23:34:42 +0900
MIME-Version: 1.0
In-Reply-To: <20210324072727.GL77072@balbir-desktop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Balbir Singh <bsingharora@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Wed, 24 Mar 2021 18:27:27 +1100, Balbir Singh wrote:
> On Wed, Mar 24, 2021 at 11:35:04AM +0900, Akira Yokosawa wrote:
>> On Wed, 24 Mar 2021 12:15:29 +1100, Balbir Singh wrote:
>>> On Tue, Mar 23, 2021 at 10:39:50PM +0900, Akira Yokosawa wrote:
>>>> Hi Balbir,
>>>>
>>>> I am surprised to see perfbook's LaTeX codebase works fairly well
>>>> in the ebook paper size.
>>>>
>>>
>>> It does and it makes it easier on the eyes. My suggestion is to
>>> try the patch and then see for yourself, it'll help with the
>>> improvements you suggest below
>>>  
>>>> Impressive, indeed!
>>>>
>>>
>>> Yep, the magic is done by LaTeX :)
>>>
>>>> A few inline comments:
>>>>
>>>> On Tue, 23 Mar 2021 20:38:22 +1100, Balbir Singh wrote:
>>>>> On Mon, Mar 22, 2021 at 10:23:54PM -0700, Paul E. McKenney wrote:
>>>>>> On Tue, Mar 23, 2021 at 12:01:53PM +1100, Balbir Singh wrote:
>>>>> ...
>>>>>> Very good!
>>>>>>
>>>>>> But would it be possible to create a separate build target for this
>>>>>> combination?  Just in case others are using 1c for normal-sized paper?
>>>>>>
>>>>>
>>>>> Add support for ebooksize, which is roughly the size of
>>>>> a kindle (4.5in, 6.3in) with margin size of 0.2in. The
>>>>> recommended changes were taken from stackexchange with
>>>>> links in the code. Not all tables take nicely to the
>>>>> new size and warnings are produced, these warnings are about
>>>>> about overfull hbox's. This size/target also enforces
>>>>> single column output and increases the size of the pdf
>>>>> by almost 40% in terms of number of pages. The actual size
>>>>> on the disk is not all that different. The final output
>>>>> though is very readable on the kindle I own.
>>>>>
>>>>> I've been running the command via
>>>>>
>>>>> env PERFBOOK_PAPER=ER make perfbook-er.pdf
>>>>
>>>> Do you still need to set PERFBOOK_PAPER? 
>>>>
>>>
>>> I use it to set PERFBOOK_BASE
>>
>> Without setting PERFBOOK_PAPER,
>> just "make perfbook-er.pdf" works fine.
>>
>> I mean, env PERFBOOK_PAPER=ER make perfbook-1c.pdf
>> will generate the same PDF as perfbook-er.pdf would (without
>> PERFBOOK_PAPER set).
>>
>> Which is mostly the same as perfbook-a4.pdf and perfbook-hb.pdf
>> work when PERFBOOK_PAPER=A4 or PERFBOOK_PAPER=HB is specified.
>>
>>>
>>>>>
>>>>> TODOs:
>>>>> 1. Make tables and some figures work nicely in this mode
>>>>
>>>> Shrinking tables and figures is not so hard, but to shrink tall
>>>> code snippets might be tricky.
>>>>
>>>
>>> The code snippets turned out just fine, the tables had overflows.
>>> Even the images are largely fine.
>>
>> I see code snippets more than 53 lines are truncated in the -er build.
>>
>>>  
>>>> I have some ideas to do them.  Can you wait a couple of days?
>>>> I'll post some PoC scheme for you to base your further tuning.
>>>>
>>>> Just shrinking tables and code snippets might result in
>>>> illegibly small font, though.
>>>>
>>>
>>> The code is fine so far, I think with the tables, we might need
>>> to find a way for allowing them to cross page boundaries, I have
>>> not looked at the table macros yet.
>>>
>>> My suggestion is for you to try the patch, see the rendered PDF
>>> output and look for artifacts like table 9.1
>>
>> I've tested my scheme on top of your patch and applied the
>> scheme in cpu, toolsoftrade, cpu, and defer/rcuapi.
>>
>> Can you try the patch set I'm sending out soon as replies to this
>> message.
>>
>> I'm not saying the scheme works for every oversized float types,
>> though.
>>
>>>  
>>>>> 2. Consider scaling the font
>>>>
>>>> You mean the font size of 10pt is too large for ebook readers?
>>>>
>>>
>>> I meant largely for tables, the font size on my kindle seems nice.
>>
>> I see. My scheme shirks tables as a whole, so some of them might
>> become hard to read.
>>
> 
> Works OK for me so far, it does a tighter packing of tables and
> if we shrink the font size, I am sure we can make the tables fit :)
> 
> Acked-by: Balbir Singh <bsingharora@gmail.com>

Thanks! Applied.

I'll send a (non-RFC) patch set to Paul including your patch as
the first one.
I'll also add an update of floats in style guide and other
documentation updates.

There is one thing I'd like to change.
Balbir, do you mind if I change the target name to perfbook-eb.pdf
and PERFBOOK_PAPER's value of "EB"?

I tend to think "er" or "ER" is suggesting something related to "error".

We already have "-hb" as the hardcover-book paper size, so I think
using "-eb" for ebook-display size makes sense.

Thoughts? 

By the way, have you started updating the other floats I didn't touch?

If so, I'll leave the work on ebook to you and go back to the indexing
I'm working on.

        Thanks, Akira

> 
> Balbir Singh. 
> 
