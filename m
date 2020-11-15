Return-Path: <SRS0=DNQX=EV=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9A5JmM958wJ+g+3so6JCtvk4mO+Y/dDV7Cxssg5sO88=;
        b=C7YJgNNXn471IK3G9fh7d0n+lVcstoyCuHgn7tGEVqsxIUbCbwhC0EcqEcHK2g+fI2
         yJ7e9nyffHDl72u1w4nnHeE0/4BTZv5FMP1nbssnEIerhk+Y/nGBg2XwxzQakd1WX0LW
         BDszTqIR0uqMqAIVOKBbFIoG28CZ7cBsiT43qjFxq4sNxyE3rOqgSbkGOglaiJ/3ekbm
         eyUODflj22UMq6tWc5Hmi839OzxoE4c0PCP2yH+RFuBGEUz3BHmtPSLQxAv7GErAouZO
         lB8Un/RTGwdZnddExTNoNPnJUZnuQVD7v/pOeFSRkUSevhqourQxKZWknoBK5XijAvoG
         uxug==
Subject: Re: [PATCH perfbook 0/2] CodeSamples/formal: Cleanup of init blocks
 in litmus tests
References: <7e9cc3fb-12af-eb3c-2d81-74486dd9e061@gmail.com>
 <20201115204244.GM3249@paulmck-ThinkPad-P72>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <55d8594a-048d-15f3-b3fc-36ca6594545e@gmail.com>
Date: Mon, 16 Nov 2020 07:25:09 +0900
MIME-Version: 1.0
In-Reply-To: <20201115204244.GM3249@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Sun, 15 Nov 2020 12:42:44 -0800, Paul E. McKenney wrote:
> On Sat, Nov 14, 2020 at 01:51:01PM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> This patch set is what I mentioned the other day in response to
>> your LKMM patch for 5.11.
>> klitmus7 doesn't need most of type info in litmus-test init blocks.
>>
>> While there are some cases where klitmus7 requires type info of variables
>> to be watched (via the "exists", "locations", or "filter" directive),
>> as long as the watched variables are of type "int", extra type info
>> in the init block is not required.
>>
>> Litmus tests under CodeSamples/formal/ should keep compatible with
>> klitmus7 after this patch set is applied.
>>
>> Patch 1/2 removes initialization to 0 and type info of "int" or "int *"
>> under CodeSamples/formal/litmus/.
>>
>> Patch 2/2 further reduce line counts of litmus tests by using "{}"
>> as empty init blocks.
>> It also adds/removes empty lines for those code snippets to have
>> consistent looks.
>>
>> Similar changes to patch 1/2 can be made in the RCU litmus tests
>> presented in Section 12.3.2. They are not touched in this patch set.
>>
>> May be in a follow-up patch.
> 
> Queued and pushed, thank you very much!
> 
>>         Thanks, Akira
>>
>> *NOTE*:
>>
>> There are cases where litmus tests for herd7 can not be
>> made compatible with (current) klitmus7, though.
>>
>> One such example is when a variable of a type other than the "int"
>> or "int *" (such as "spinlock_t") is specified in the "locations" or "filter"
>> directive.
>> Current klitmus7 has no idea of the way to obtain the value of such a
>> variable.
> 
> Good to know!  Do we have litmus tests that have problems with this?

One such litmus test can be made up based on CodeSamples/formal/herd/C-Lock1.litmus

---
C Lock1-for-herd7

(*
 * Example test incompatible with klitmus7
 *
 * klitmus7 cannot access spinlock_t variable.
 *)

{}

P0(int *x, spinlock_t *sp)
{
	spin_lock(sp);
	WRITE_ONCE(*x, 1);
	WRITE_ONCE(*x, 0);
	spin_unlock(sp);
}

P1(int *x, spinlock_t *sp)
{
	int r1;

	spin_lock(sp);
	r1 = READ_ONCE(*x);
	spin_unlock(sp);
}

locations [sp]    (* incompatible with klitmus7 *)
exists (1:r1=1)
---

klitmus7 can't convert this to a kernel module:

---
$ klitmus7 -o temp C-Lock1-for-herd7.litmus
File "C-Lock1-for-herd7.litmus" Parameter sp, type mismatch int vs. spinlock_t
---

Actually, herd7/LKMM does complain of this one:

---
Test Lock1-for-herd7 Allowed
States 1
1:r1=0; sp=0;
No
Witnesses
Positive: 0 Negative: 2
Flag lock-final                          <---
Condition exists (1:r1=1)
Observation Lock1-for-herd7 Never 0 2
Time Lock1-for-herd7 0.01
Hash=5d10e6c355cec0c36f354abf175adc54
---

Comment at line 57 of lock.cat says:

---
(* The final value of a spinlock should not be tested *)
flag ~empty [FW] ; loc ; [ALL-LOCKS] as lock-final
---

        Thanks, Akira

> 
>> As for herd7, all the variables are treated as if they were "int" or
>> "int *" regardless of the type specified in the litmus tests, there
>> is no such problem.
> 
> Indeed, herd7 lets you get away with quite a bit.  ;-)
> 
> 							Thanx, Paul
> 
>> --
>> Akira Yokosawa (2):
>>   CodeSamples/formal/litmus: Remove redundant initializations
>>   CodeSamples/formal: Use '{}' for empty init blocks in litmus tests
>>
>>  CodeSamples/formal/herd/C-LB+o-rl-rul-o+o-rl-rul-o.litmus | 5 ++---
>>  CodeSamples/formal/herd/C-LB+rl-o-o-rul+rl-o-o-rul.litmus | 5 ++---
>>  CodeSamples/formal/herd/C-Lock1.litmus                    | 5 +++--
>>  CodeSamples/formal/herd/C-Lock2.litmus                    | 5 +++--
>>  .../C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-C.litmus | 3 +--
>>  ...C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-CE.litmus | 3 +--
>>  .../C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-X.litmus | 3 +--
>>  ...C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-XE.litmus | 3 +--
>>  .../C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u.litmus   | 3 +--
>>  .../herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-C.litmus    | 3 +--
>>  .../herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-CE.litmus   | 3 +--
>>  .../herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-X.litmus    | 3 +--
>>  .../herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-XE.litmus   | 3 +--
>>  .../herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u.litmus      | 3 +--
>>  .../formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-C.litmus     | 3 +--
>>  .../formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-CE.litmus    | 3 +--
>>  .../formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-X.litmus     | 3 +--
>>  .../formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u-XE.litmus    | 3 +--
>>  .../formal/herd/C-SB+l-o-o-u+l-o-o-u+l-o-o-u.litmus       | 3 +--
>>  CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-C.litmus     | 3 +--
>>  CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-CE.litmus    | 3 +--
>>  CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-X.litmus     | 3 +--
>>  CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u-XE.litmus    | 3 +--
>>  CodeSamples/formal/herd/C-SB+l-o-o-u+l-o-o-u.litmus       | 3 +--
>>  .../formal/herd/C-SB+o-rcusync-o+i-rl-o-o-rul.litmus      | 5 ++---
>>  CodeSamples/formal/herd/C-SB+o-rcusync-o+o-o.litmus       | 5 ++---
>>  ...B+o-rcusync-o+o-rcusync-o+rl-o-o-rul+rl-o-o-rul.litmus | 7 ++-----
>>  .../formal/herd/C-SB+o-rcusync-o+o-rcusync-o.litmus       | 5 ++---
>>  .../formal/herd/C-SB+o-rcusync-o+o-rl-o-rul.litmus        | 5 ++---
>>  .../formal/herd/C-SB+o-rcusync-o+o-rl-rul-o.litmus        | 5 ++---
>>  .../herd/C-SB+o-rcusync-o+rl-o-o-rul+rl-o-o-rul.litmus    | 6 ++----
>>  .../formal/herd/C-SB+o-rcusync-o+rl-o-o-rul.litmus        | 5 ++---
>>  .../formal/herd/C-SB+o-rcusync-o+rl-o-rul-o.litmus        | 5 ++---
>>  CodeSamples/formal/litmus/C-2+2W+o-o+o-o.litmus           | 5 ++---
>>  CodeSamples/formal/litmus/C-2+2W+o-wmb-o+o-wmb-o.litmus   | 5 ++---
>>  CodeSamples/formal/litmus/C-CCIRIW+o+o+o-o+o-o.litmus     | 5 ++---
>>  CodeSamples/formal/litmus/C-ISA2+o-r+a-r+a-r+a-o.litmus   | 5 ++---
>>  .../formal/litmus/C-LB+a-o+o-data-o+o-data-o.litmus       | 5 ++---
>>  CodeSamples/formal/litmus/C-LB+a-r+a-r+a-r+a-r.litmus     | 5 ++---
>>  .../formal/litmus/C-LB+cmpxchg-ctrl-o+o-ctrl-o.litmus     | 4 ++--
>>  .../formal/litmus/C-LB+o-cge-o+o-cge-o+dstb.litmus        | 4 ++--
>>  CodeSamples/formal/litmus/C-LB+o-cge-o+o-cge-o.litmus     | 4 ++--
>>  CodeSamples/formal/litmus/C-LB+o-cgt-o+o-cgt-o.litmus     | 4 ++--
>>  .../formal/litmus/C-LB+o-data-o+o-data-o+o-data-o.litmus  | 7 +++----
>>  CodeSamples/formal/litmus/C-LB+o-o+o-o.litmus             | 5 ++---
>>  CodeSamples/formal/litmus/C-LB+o-r+a-o.litmus             | 5 ++---
>>  CodeSamples/formal/litmus/C-LB+o-r+o-ctrl-o.litmus        | 6 +++---
>>  CodeSamples/formal/litmus/C-LB+o-r+o-data-o.litmus        | 5 ++---
>>  CodeSamples/formal/litmus/C-MP+o-o+o-rmb-o.litmus         | 8 ++------
>>  CodeSamples/formal/litmus/C-MP+o-r+o-ctrl-o.litmus        | 7 ++-----
>>  CodeSamples/formal/litmus/C-MP+o-wmb-o+o-addr-o.litmus    | 8 ++------
>>  CodeSamples/formal/litmus/C-MP+o-wmb-o+o-o.litmus         | 7 +------
>>  CodeSamples/formal/litmus/C-MP+o-wmb-o+o-rmb-o.litmus     | 7 +------
>>  CodeSamples/formal/litmus/C-MP-OMCA+o-o-o+o-rmb-o.litmus  | 4 ++--
>>  CodeSamples/formal/litmus/C-R+o-wmb-o+o-mb-o.litmus       | 5 ++---
>>  CodeSamples/formal/litmus/C-S+o-wmb-o+o-addr-o.litmus     | 8 ++------
>>  CodeSamples/formal/litmus/C-SB+o-mb-o+o-mb-o.litmus       | 5 ++---
>>  CodeSamples/formal/litmus/C-SB+o-o+o-o.litmus             | 6 +++---
>>  .../formal/litmus/C-SB-OMCA+o-o-rmb-o+o-o-rmb-o.litmus    | 4 +---
>>  .../formal/litmus/C-W+RWC+o-mb-o+a-o+o-mb-o.litmus        | 6 +-----
>>  CodeSamples/formal/litmus/C-W+RWC+o-r+a-o+o-mb-o.litmus   | 6 +-----
>>  CodeSamples/formal/litmus/C-WRC+o+o-data-o+o-rmb-o.litmus | 4 ++--
>>  CodeSamples/formal/litmus/C-WRC+o+o-r+a-o.litmus          | 3 +--
>>  .../formal/litmus/C-WWC+o+o-data-o+o-addr-o.litmus        | 6 ++----
>>  CodeSamples/formal/litmus/C-WWC+o+o-r+o-addr-o.litmus     | 6 ++----
>>  .../formal/litmus/C-WWC+o-cge-o+o-cge-o+o+dstb.litmus     | 4 ++--
>>  CodeSamples/formal/litmus/C-WWC+o-cge-o+o-cge-o+o.litmus  | 4 ++--
>>  .../formal/litmus/C-WWC+o-cgt-o+o-cgt-o+o+dstb.litmus     | 4 ++--
>>  CodeSamples/formal/litmus/C-WWC+o-cgt-o+o-cgt-o+o.litmus  | 4 ++--
>>  CodeSamples/formal/litmus/C-Z6.2+o-r+a-o+o-mb-o.litmus    | 6 +-----
>>  CodeSamples/formal/litmus/C-Z6.2+o-r+a-r+a-r+a-o.litmus   | 5 ++---
>>  CodeSamples/formal/litmus/C-cmpxchg.litmus                | 4 ++--
>>  memorder/memorder.tex                                     | 8 ++------
>>  73 files changed, 124 insertions(+), 217 deletions(-)
>>
>> -- 
>> 2.17.1
>>
