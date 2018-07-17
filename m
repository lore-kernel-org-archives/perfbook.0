Return-Path: <e2lahav@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc;        bh=layAWSwegkKhpLEevgriEwhr0hmKSTDeU4gE3Wws4y8=;
 b=d/Ptkfxy7txkw2WVJ3NEmb7dtYWfdYmgn1IzKMV+4phtkvO+lRcTdwM9qUbpojiua/
 B8Ugzp1lcOQELuN9kypt0eu9g/vyJ5kuu0WodqzpH+KqRX85c1bdbzOJDds2OyHTg7Gh
 fP1Dv97sWQxpuP1MjHoEXokWYb2mf00WAvljJr+Y6A5oEj42Mhhf7B/oLWgMs9BQyZYY
 sMu8/ea4D/mhyr4UEI+qgSEZ6djek4II3KiNoYGO8EC9Xsp+W70JsS69m4N/jcDBr3Hk
 4c1cW/ZLjKegWIDxNYp10QwmbETckVV42lPdc7HwTzg8TiI4J+OvD8VfLFklWuVqZjQe
 gA7Q==
MIME-Version: 1.0
In-Reply-To: <488f7451-7a08-4a93-f2d0-60fb4c541782@gmail.com>
References: 
 <CAJbg=FVjq_rwhvSw3Y=7xOxUqN_kV4P=wD42HU9=1u3KGnyJpg@mail.gmail.com>
 <20180714233313.GH12945@linux.vnet.ibm.com>
 <4131cfaa-45c2-e0e0-ecc0-dfa3058c53c3@gmail.com>
 <CAJbg=FW7vpepT_0wq+ffpQBHgKX+s1ruDb5Bs-m3FCPHKcPV3A@mail.gmail.com>
 <488f7451-7a08-4a93-f2d0-60fb4c541782@gmail.com>
From: Elad Lahav <e2lahav@gmail.com>
Date: Tue, 17 Jul 2018 07:05:03 -0400
Message-ID: 
 <CAJbg=FWbVmimBhPb_C35uwSepfnuJGRJKtN=3dEL7LsggGBg1g@mail.gmail.com>
Subject: Re: Section 4.2: wrong error reporting for pthread functions
Content-Type: text/plain; charset="UTF-8"
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Sure, that works for me ;-)

One more nitpick - on sub-section 4.2.7 there is an unmatched left
parenthesis before "and":

"POSIX supplies the pthread_key_create() function to create
a per-thread variable (and return the corresponding key, ..."

--Elad


On Mon, Jul 16, 2018 at 7:51 PM, Akira Yokosawa <akiyks@gmail.com> wrote:
> Hi Elad,
>
> On 2018/07/17 1:35, Elad Lahav wrote:
>> On Mon, Jul 16, 2018 at 11:42 AM, Akira Yokosawa <akiyks@gmail.com> wrote:
>>> First, two helpers are defined as follows:
>>>
>>>        #define handle_error_en(en, msg) \
>>>                do { errno = en; perror(msg); exit(EXIT_FAILURE); } while (0)
>>>
>>>        #define handle_error(msg) \
>>>                do { perror(msg); exit(EXIT_FAILURE); } while (0)
>>>
>>> Then, one of the call sites looks as follows:
>>>
>>>                s = pthread_create(&tinfo[tnum].thread_id, &attr,
>>>                                   &thread_start, &tinfo[tnum]);
>>>                if (s != 0)
>>>                    handle_error_en(s, "pthread_create");
>>>
>>> If we employ this pattern, one of the hunks in your patch will look like:
>>>
>>> -       if (pthread_mutex_lock(pmlp) != 0) {
>>> -               perror("lock_reader:pthread_mutex_lock");
>>> -               exit(-1);
>>> -       }
>>> +       if ((en = pthread_mutex_lock(pmlp)) != 0)
>>> +               handle_error_en(en, "lock_reader:pthread_mutex_lock");
>>>
>>> Thoughts?
>>
>> You are, of course, free to do as you want with your book, but I would
>> advise against the proposal. Novice software developers will often
>> copy patterns from books, which means that the examples need to be
>> held to a higher standard. I do agree that error handling is not the
>> point of these examples, so you shouldn't spend too much time on it,
>> but at least at one point it should show the correct pattern. The rest
>> of the code can just have a "// Report error and exit" comment.
>> If you do want a helper, then a better solution would be:
>>
>> static inline void __attribute__((noreturn))
>> fatal(char const * const msg, int const err)
>> {
>>     fprintf(stderr, "%s: %s\n", msg, strerror(err));
>>     exit(EXIT_FAILURE);
>> }
>>
>> The name 'fatal' better conveys to the reader of the code the fact
>> that the call doesn't return. The snippet also demonstrates a more
>> modern approach to C code (use of inline functions, const, function
>> attributes).
>
> Thank you for your feedback!
>
> I agree with you that inline functions are better choice.
> You might also want to update the example in the man pages? ;-)
>
> Would function names of "fatal_en()" and "fatal()" as defined below
> work with you?
>
> static inline void __attribute__((noreturn))
> fatal_en(char const * const msg, int const err)
> {
>     fprintf(stderr, "%s: %s\n", msg, strerror(err));
>     exit(EXIT_FAILURE);
> }
>
> static inline void __attribute__((noreturn))
> fatal(char const * const msg)
> {
>     perror(msg);
>     exit(EXIT_FAILURE);
> }
>
>       Thanks, Akira
>>
>> --Elad
>>
>

