Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SVcTpPYhaJOLw7L3DRVK5mx0Dgb010j9N/bhTuvXQ3U=;
        b=V/OTnIEwE8sG3cHy7uGGG/T4SRp7H2Uin6k5GZYyK7bmD6wbrlOSkIC250krOrEVvD
         mn5dI2BGSeGLlBAKBkSyqzUcKu/dY7Z82asnEx27dBog0PjRNcVpLPbON0LLvOLwLrNi
         avGI/9dfNk8+Nd3l28kEeoaQ8NroxSNSRQ4AXUl+oGxCr5WT2ZAeyuCF6X9oeOI0wcBZ
         PTPcSCYTrFqveLpYwqgHQZRBYrOqxuuwrt+PYm5OPvHdIhXpNHqdDWW8UV8amqx5dIhf
         IUhG9/xb/O60Jr7WHpaZvHhKibLw/umyVOaLSi8x6OY8oaPur/xDnT9FHb0ECBnEXCHV
         fxSw==
MIME-Version: 1.0
References: <20181020163648.GA2674@linux.ibm.com> <CABoNC80CeE8XsQMHAO-GrSuUQ86z7Z6frm04XUWNbxWtkmKsNA@mail.gmail.com>
 <073797d5-67f7-7426-f895-8004428a84ab@gmail.com> <CABoNC828mNgvvqcUm65d+PFdBVB1Pp6FzEyXniPbxo-dUeLxpw@mail.gmail.com>
 <20181025094516.GO4170@linux.ibm.com> <CABoNC81fnRn3H3wB+Zx7WG7QPw7qLa13pVcUzxQ-zdX3vtaxuA@mail.gmail.com>
 <444c8f09-b9b3-9564-2418-a7c93198f2e7@gmail.com> <ca3f5f62-be71-7cd0-c251-1c544a8170ca@gmail.com>
 <CABoNC80D9bO6bXi5YfOAA6dJzUEwObHKuYihS5P0-9DdOaK0GQ@mail.gmail.com>
 <5c2c8a25-cc15-d262-34fc-ae5eb1f5d6f6@gmail.com> <20181028001723.GJ4170@linux.ibm.com>
In-Reply-To: <20181028001723.GJ4170@linux.ibm.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Sun, 28 Oct 2018 20:08:21 +0800
Message-ID: <CABoNC82HM5aTauUv573+7NtnZ060_N=mfdLSjAyfGoz2dk3qNQ@mail.gmail.com>
Subject: Re: [Possible BUG] count_lim_atomic.c fails on POWER8
Content-Type: text/plain; charset="UTF-8"
To: Paul McKenney <paulmck@linux.ibm.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Sun, Oct 28, 2018 at 8:17 AM Paul E. McKenney <paulmck@linux.ibm.com> wrote:
>
> On Sat, Oct 27, 2018 at 11:56:54PM +0900, Akira Yokosawa wrote:
> > On 2018/10/26 08:58:30 +0800, Junchang Wang wrote:
> > [...]
> > >
> > > BTW, I found I'm not good in writing C macro (e.g., cmpxchg). Do you
> > > know some specification/document on writing C macro functions in
> > > Linux?
> >
> > Although I'm not qualified as a kernel developer,
> > Linux kernel's "coding style" has a section on this. See:
> >
> > https://www.kernel.org/doc/html/latest/process/coding-style.html#macros-enums-and-rtl
> >
> > In that regard, macros I added in commit b2acf6239a95
> > ("count: Tweak counttorture.h to avoid segfault") do not meet
> > the style guide in a couple of ways:
> >
> >     1) Inline functions are preferable to macros resembling functions
> >     2) Macros with multiple statements should be enclosed in a do - while block
> >     3) ...
> >
> > Any idea for improving them is more than welcome!
>
> Let's see...
>
> #define cmpxchg(ptr, o, n) \
> ({ \
>         typeof(*ptr) _____actual = (o); \
>         \
>         __atomic_compare_exchange_n(ptr, (void *)&_____actual, (n), 1, \
>                         __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST) ? (o) : (o)+1; \
> })
>
> We cannot do #1 because cmpxchg() is type-generic, and thus cannot be
> implemented as a C function.  (C++ could use templates, but we are not
> writing C++ here.)
>
> We cannot do #2 because cmpxchg() must return a value.
>
> Indentation is not perfect, but given the long names really cannot be
> improved all that much, if at all.
>
> However, we do have a problem, namely the multiple uses of "o", which
> would be very bad if "o" was an expression with side-effects.
>
> How about the following?
>
> #define cmpxchg(ptr, o, n) \
> ({ \
>         typeof(*ptr) _____old = (o); \
>         typeof(*ptr) _____actual = _____old; \
>         \
>         __atomic_compare_exchange_n(ptr, (void *)&_____actual, (n), 1, \
>                         __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST)
>                         ? _____old : _____old + 1; \
> })
>
> This still might have problems with signed integer overflow, but I am
> inclined to ignore that for the moment.  Because paying attention to it
> results in something like this:
>
> #define cmpxchg(ptr, o, n) \
> ({ \
>         typeof(*ptr) _____old = (o); \
>         typeof(*ptr) _____actual = _____old; \
>         \
>         __atomic_compare_exchange_n(ptr, (void *)&_____actual, (n), 1, \
>                         __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST) \
>                         ? _____old \
>                         : _____old > 0 ? _____old - 1; : _____old + 1; \
> })
>
> Thoughts?  Most especially, any better ideas?
>

Hi Paul and Akira,

Thanks a lot for the mail. I have been curious about why cmpxchg()
sticks to returning the old value to notify the caller if the CAS
operation succeeds. Besides the overflow issue mentioned in Paul's
last mail, current cmpxchg() can only be used in the control flow of
"if CAS fails, do something" (Control Flow 1). However, it cannot be
used in the control flow of "if CAS succeeds, do something" (Control
Flow 2).

So another option is that cmpxchg() could just return true or false,
and if the caller needs the current value of the content of the
specified memory address, it could read the value out of field *old*.
Of course, we must adjust the parameters of cmpxchg() slightly by
passing the address of *old* to the function. Here is how cmpxchg()
looks like in my mind:

#define cmpxchg(ptr, o, n) \
({ \
        __atomic_compare_exchange_n(ptr, (void *)(o), (n), 1, \
                        __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST); \
})

static __inline__ int atomic_cmpxchg(atomic_t *v, int *old, int new)
{
        return cmpxchg(&v->counter, old, new);
}

Any thoughts? Or did I miss something here? I will send the full patch
in another thread in case you want to review the code.


Thanks,
--Junchang


>                                                         Thanx, Paul
>

