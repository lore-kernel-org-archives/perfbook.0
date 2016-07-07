Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=ywbGHtT2lnJt5YBAuXApKapNkOS7KsvcWh853Jg4/jA=;
 b=P+hWTaDB/ypeHY9JGviwlXCnxX4HVqCNW0NrdODo3TOAA6zJjgKPkeoijpCSbRNBZK
 6T0CJrbSzZW3t7awjxAclPAbG/mkLLtFe10z3MQp1WKTDfX0nn1HHG5PuaKHxzrMWvh0
 Pdcqp5sMyHqm1S8v7leV9ZahaTCTDJQCCGN67dju490xBLHT9Xo6AovTtZ4kUq0SGCrd
 wDTcL9NztoKFAxWkTmSPXbx/7n4lG2KDGhBzljRm+Iy241XYddwpPq3V97USH1CtkXW0
 H5UzNGJ8DPPemauUGM9gLTXMF+2MaVFFdzRn1FP5SUyifESeujIFiyuCKCjzpD6XY0YS
 wOsg==
Subject: Re: [GIT PULL] Another round of qqz improvement
References: <fd3e2eb5-8080-489a-60fa-72836512dd64@gmail.com>
 <20160707024557.GI4650@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <38f7bfb9-8532-02fc-524c-bfe0cd9115c6@gmail.com>
Date: Thu, 7 Jul 2016 22:46:18 +0900
MIME-Version: 1.0
In-Reply-To: <20160707024557.GI4650@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/07/06 19:45:57 -0700, Paul E. McKenney wrote:
> On Thu, Jul 07, 2016 at 07:29:24AM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> This is another round of qqz improvement.
>> 1st and 3rd patch improve vertical spacings in Appendix D.
>> 2nd patch modifies the target of back link at the end of QQA
>> to the end of QQ in the main text.
>> This makes it easier to continue reading after reading an Answer.
>> The white box at the end of QQA is added recently, and its change
>> in behavior will cause little confusion if any, I think.
>
> Hello, Akira,
>
> I applied the first and third, but skipped the second.  I tried it, but
> couldn't help thinking that showing the quick quiz upon return might
> help with continuity.  "What was I doing again?  Oh, right, I just came
> back to the quick quiz on the page."

I see. I respect your preference.
As a matter of fact, it took a few days for me to get used to the modified
behavior. When you expect the behavior, it would feel smoother especially
where a Quick Quiz is broken at the bottom of a left column in two column
format.

Anyway, I agree with you that current behavior is suitable as a default.

                                                  Thanks, Akira

>
> 							Thanx, Paul
>
>>                                             Thanks, Akira
>>
>> ---
>> The following changes since commit 22af283e2a52cdf4a1c944fc97f00ce6a7a25ef8:
>>
>>   Add diagnostics to route_rcu to reliably detect use-after-free (2016-07-05 15:52:16 -0700)
>>
>> are available in the git repository at:
>>
>>   https://github.com/akiyks/perfbook.git qqz-use-vspace
>>
>> for you to fetch changes up to 746d78491c4dc47bcf72bfaf23724d568582d192:
>>
>>   qqz: Give room for \parskip to suppress orphans (2016-07-07 07:07:17 +0900)
>>
>> ----------------------------------------------------------------
>> Akira Yokosawa (3):
>>       qqz: Use \vspace{} for vertical spacing in Appendix D.
>>       qqz: Modify back link target at end of QQA to end of QQ
>>       qqz: Give room for \parskip to suppress orphans
>>
>>  qqz.sty | 22 +++++++++++++++++-----
>>  1 file changed, 17 insertions(+), 5 deletions(-)
>>
>
>

