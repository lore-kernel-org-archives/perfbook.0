Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7mbIepOTf022Er8JyX4HkUxBhCEaCmM0h8r5vXBq6IY=;
 b=K0j+PmgHPhqH4Vx5pQEjn6Lwe32v1mRBET9XmIkRx0PaIjRFY8ZftNrJO2Bd8z7+Yw
 iE9ayR565ZKtQSnT5czHQ7XLCkho6q24UBwIaN5kV1vuFNMl4MAdKx6iHM8G8kWR+7jz
 lAM6jzxKotivdliBqgakrC4OVnOFNh21LKUTwSLC+n3rLMEdTjQOu3Yeh+4F8Un6ZvVA
 qn6EYF6EzebeFKo63Ys+TkweOsmab8K9zDIzis7I9akXd04sdX8rn2o2cTfjAj+4LUJB
 Bki9fGASes0fKbGZY0AG+P2itUNjvN4buUDnS8RMfVCcX8+V1s07Sv64DnseEiFTbSwI
 h/yg==
Subject: Re: Section 4.2: wrong error reporting for pthread functions
References: 
 <CAJbg=FVjq_rwhvSw3Y=7xOxUqN_kV4P=wD42HU9=1u3KGnyJpg@mail.gmail.com>
 <20180714233313.GH12945@linux.vnet.ibm.com>
 <4131cfaa-45c2-e0e0-ecc0-dfa3058c53c3@gmail.com>
 <CAJbg=FW7vpepT_0wq+ffpQBHgKX+s1ruDb5Bs-m3FCPHKcPV3A@mail.gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <488f7451-7a08-4a93-f2d0-60fb4c541782@gmail.com>
Date: Tue, 17 Jul 2018 08:51:20 +0900
MIME-Version: 1.0
In-Reply-To: 
 <CAJbg=FW7vpepT_0wq+ffpQBHgKX+s1ruDb5Bs-m3FCPHKcPV3A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Elad Lahav <e2lahav@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Elad,

On 2018/07/17 1:35, Elad Lahav wrote:
> On Mon, Jul 16, 2018 at 11:42 AM, Akira Yokosawa <akiyks@gmail.com> wrote:
>> First, two helpers are defined as follows:
>>
>>        #define handle_error_en(en, msg) \
>>                do { errno = en; perror(msg); exit(EXIT_FAILURE); } while (0)
>>
>>        #define handle_error(msg) \
>>                do { perror(msg); exit(EXIT_FAILURE); } while (0)
>>
>> Then, one of the call sites looks as follows:
>>
>>                s = pthread_create(&tinfo[tnum].thread_id, &attr,
>>                                   &thread_start, &tinfo[tnum]);
>>                if (s != 0)
>>                    handle_error_en(s, "pthread_create");
>>
>> If we employ this pattern, one of the hunks in your patch will look like:
>>
>> -       if (pthread_mutex_lock(pmlp) != 0) {
>> -               perror("lock_reader:pthread_mutex_lock");
>> -               exit(-1);
>> -       }
>> +       if ((en = pthread_mutex_lock(pmlp)) != 0)
>> +               handle_error_en(en, "lock_reader:pthread_mutex_lock");
>>
>> Thoughts?
> 
> You are, of course, free to do as you want with your book, but I would
> advise against the proposal. Novice software developers will often
> copy patterns from books, which means that the examples need to be
> held to a higher standard. I do agree that error handling is not the
> point of these examples, so you shouldn't spend too much time on it,
> but at least at one point it should show the correct pattern. The rest
> of the code can just have a "// Report error and exit" comment.
> If you do want a helper, then a better solution would be:
> 
> static inline void __attribute__((noreturn))
> fatal(char const * const msg, int const err)
> {
>     fprintf(stderr, "%s: %s\n", msg, strerror(err));
>     exit(EXIT_FAILURE);
> }
> 
> The name 'fatal' better conveys to the reader of the code the fact
> that the call doesn't return. The snippet also demonstrates a more
> modern approach to C code (use of inline functions, const, function
> attributes).

Thank you for your feedback!

I agree with you that inline functions are better choice.
You might also want to update the example in the man pages? ;-)

Would function names of "fatal_en()" and "fatal()" as defined below
work with you?

static inline void __attribute__((noreturn))
fatal_en(char const * const msg, int const err)
{
    fprintf(stderr, "%s: %s\n", msg, strerror(err));
    exit(EXIT_FAILURE);
}

static inline void __attribute__((noreturn))
fatal(char const * const msg)
{
    perror(msg);
    exit(EXIT_FAILURE);
}

      Thanks, Akira
> 
> --Elad
> 

