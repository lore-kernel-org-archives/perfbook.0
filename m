Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ed9ejxgLou6sU7l5SMahT1KdvA9+s/s8ycximmqJfPw=;
 b=jI+8gDhaKHd3tdLS5BtbmCWpDEpciIQR9XIfw1mX3lvjhBbhAkC2GlSuaZ3q6KNRGZ
 rTSmv3awJNBcA6r/P7fsSII/CKzZPc9XQEm9iG4goXCpBc9VFWOIfgYLfHq8qO31pNpQ
 R0LVDdy6neSIgzF7/RMxExOCHO/K8CwkMAn7THHZA43tF8bPFu1z3r9vZWbwldezv4wu
 ahUOuMBXBx/7TQQQEEWHc1cSiYpI02ku2767Uxw0fDQuIzvgfdTAtFkxC2iRXNZ1/ips
 ybjL4H7+C29RRhp17zD/r36QNtwrwJ1tIkmtUVaIzNBET94+5kcB7tinHRZFEfa6csZt
 KVeg==
MIME-Version: 1.0
In-Reply-To: <20170514042023.GN3956@linux.vnet.ibm.com>
References: <1494515022-30278-1-git-send-email-junchangwang@gmail.com>
 <1494515022-30278-2-git-send-email-junchangwang@gmail.com>
 <61acaa88-abd6-58f5-4d1f-80a2ef58d53e@gmail.com>
 <20170513124556.GJ3956@linux.vnet.ibm.com>
 <831607d1-8169-ee2c-1d48-c70381481cda@gmail.com>
 <20170513225637.GL3956@linux.vnet.ibm.com>
 <45998636-1d97-3c44-1e89-543366637317@gmail.com>
 <223e58f6-0689-8357-e25d-a69dfb459d1a@gmail.com>
 <20170514042023.GN3956@linux.vnet.ibm.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Sun, 14 May 2017 21:56:31 +0800
Message-ID: 
 <CABoNC80whrygB9Lg6z+Chj9DBtuUZpPErz7G+1q9bx7o351tRA@mail.gmail.com>
Subject: Re: [PATCH 1/2] count_stat_eventual: Switch from ACCESS_ONCE() to
 READ_ONCE()/WRITE_ONCE()
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Sun, May 14, 2017 at 12:20 PM, Paul E. McKenney
<paulmck@linux.vnet.ibm.com> wrote:
> On Sun, May 14, 2017 at 10:31:51AM +0900, Akira Yokosawa wrote:
>> On 2017/05/14 9:58, Akira Yokosawa wrote:
>> > On 2017/05/14 7:56, Paul E. McKenney wrote:
>> >> On Sat, May 13, 2017 at 11:37:06PM +0900, Akira Yokosawa wrote:
>> >>> On 2017/05/13 05:45:56 -0700, Paul E. McKenney wrote:
>> >>>> On Sat, May 13, 2017 at 09:04:38PM +0900, Akira Yokosawa wrote:
>> >>>>> Hi Jason & Paul,
>> >>>>>
>> >>>>> although this has already been applied, I have a comment.
>> >>>>>
>> >>>>> On 2017/05/11 23:03:41 +0800, Junchang Wang wrote:
>> >>>>>> Signed-off-by: Junchang Wang <junchangwang@gmail.com>
>> >>>>>> ---
>> >>>>>>  CodeSamples/count/count_stat_eventual.c | 8 ++++----
>> >>>>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>> >>>>>>
>> >>>>>> diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSample=
s/count/count_stat_eventual.c
>> >>>>>> index 059ab8b..cbde4aa 100644
>> >>>>>> --- a/CodeSamples/count/count_stat_eventual.c
>> >>>>>> +++ b/CodeSamples/count/count_stat_eventual.c
>> >>>>>> @@ -27,12 +27,12 @@ int stopflag;
>> >>>>>>
>> >>>>>>  void inc_count(void)
>> >>>>>>  {
>> >>>>>> -      ACCESS_ONCE(__get_thread_var(counter))++;
>> >>>>>> +      READ_ONCE(__get_thread_var(counter))++;
>> >>>>>
>> >>>>> This is OK because READ_ONCE() is defined as the same as ACCESS_ON=
CE()
>> >>>>> in CodeSamples. However, the definition in the current Linux kerne=
l
>> >>>>> would not permit this.
>> >>>>>
>> >>>>> A read-modify-write access would need both READ_ONCE() and WRITE_O=
NCE().
>> >>>>> However, since "counter" is thread local and updated only by its o=
wner,
>> >>>>> we don't need READ_ONCE() here. So:
>> >>>>>
>> >>>>> +       WRITE_ONCE(__get_thread_var(counter), __get_thread_var(cou=
nter) + 1);
>> >>>>>
>> >>>>> should have been sufficient.
>> >>>>>
>> >>>>> Problem with this change is that the line gets too wide when appli=
ed to
>> >>>>> the code snippet in 2-column layout.
>> >>>>
>> >>>> Good point -- though renumbering the code is not all -that- hard.
>> >>>>
>> >>>> I clearly should have made a better READ_ONCE() that enforced the s=
ame
>> >>>> constraints as does the Linux kernel, perhaps something like this:
>> >>>>
>> >>>>  #define READ_ONCE(x) ({ ACCESS_ONCE(x) })
>> >>>>
>> >>>> Thoughts?
>> >>>
>> >>> I assume you meant:
>> >>>
>> >>>   #define READ_ONCE(x) ({ ACCESS_ONCE(x); })
>> >>
>> >> Indeed!  Good catch!!!
>> >>
>> >>> I'm afraid this still permits uses such as:
>> >>>
>> >>>   READ_ONCE(y)++;
>> >>>
>> >>> Looks like we need a complex definition which resembles that of
>> >>> include/linux/compiler.h.  Hmm???
>> >>
>> >> OK, how about this?
>> >>
>> >> #define READ_ONCE(x) ({ typeof(x) ___x =3D ACCESS_ONCE(x); ___x; })
>> >
>> > Ah, this resulted in an error as expected!
>> >
>> >     main.c: In function =E2=80=98inc_test=E2=80=99:
>> >     main.c:11:18: error: lvalue required as increment operand
>> >          READ_ONCE(*p)++;
>> >
>>
>> But the definition above will conflict with the argument "___x":
>>
>>       y =3D READ_ONCE(___x);
>>
>> This won't work as expected.
>> For CodeSamples, I guess we can safely reserve the name "___x".
>>
>> Thoughts?
>
> It is already reserved.  User programs are not supposed to start
> variables with "__".  Which means that the "___x" name is of dubious
> legality as far as the C standard is concerned, but so it goes.
> If the compiler starts complaining about it, it can be changed.  ;-)
>
>                                                         Thanx, Paul
>

Hi Paul and Akira,

It looks good to me :-). I can help look around and update use cases
of READ/WRITE_ONCE accordingly after the definition has been pushed.


Cheers!
--Jason

>>                    Thanks, Akira
>>
>> > Glad to know we can avoid the complexity of the kernel.
>> >
>> >                         Thanks, Akira
>> >
>> >>
>> >>> And I have another pending question regarding 2/2 of this patch set.
>> >>> That might result in other addition of line to the code. I think
>> >>> I can send it tomorrow.
>> >>
>> >> Looking forward to seeing it!  ;-)
>> >>
>> >>                                                    Thanx, Paul
>> >>
>> >>>>> Hmm...
>> >>>>>
>> >>>>>                                  Thanks, Akira
>> >>>>>
>> >>>>>>  }
>> >>>>>>
>> >>>>>>  unsigned long read_count(void)
>> >>>>>>  {
>> >>>>>> -      return ACCESS_ONCE(global_count);
>> >>>>>> +      return READ_ONCE(global_count);
>> >>>>>>  }
>> >>>>>>
>> >>>>>>  void *eventual(void *arg)
>> >>>>>> @@ -43,8 +43,8 @@ void *eventual(void *arg)
>> >>>>>>        while (stopflag < 3) {
>> >>>>>>                sum =3D 0;
>> >>>>>>                for_each_thread(t)
>> >>>>>> -                      sum +=3D ACCESS_ONCE(per_thread(counter, t=
));
>> >>>>>> -              ACCESS_ONCE(global_count) =3D sum;
>> >>>>>> +                      sum +=3D READ_ONCE(per_thread(counter, t))=
;
>> >>>>>> +              WRITE_ONCE(global_count, sum);
>> >>>>>>                poll(NULL, 0, 1);
>> >>>>>>                if (stopflag) {
>> >>>>>>                        smp_mb();
>> >>>>>>
>> >>>>>
>> >>>>
>> >>>>
>> >>>
>> >>
>> >> .
>> >>
>> >
>> >
>>
>

