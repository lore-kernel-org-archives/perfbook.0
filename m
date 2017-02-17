Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=T+VxP0hXxlXqXzIDmUDsLZZhnO7dMnCOnrJwIdTQngo=;
 b=okeD0GGScroZKrHts+YuwZDVpevI2T9tRON167NyVP8ydcw7taDwGnAtLYJ1Qk7/jL
 NHQVjdYRpPjcckwsW9eQmuX1M4IxJzuoeFF7M59eYqqdqJCZF1LNYFMOf2Q7SAETDmpl
 3SWWemMghA1qD0UAXF0ax56fcdKQ/GfQE5ey2a4FzRXB7VEg5S14wNNdV6OrKtMVN9ZF
 ixYJk9WYrSBx+ejKZOmfCdOrDtXe3MWmhMBWdcQ9hsKuaCzdEKUvBx1ToKK+CG71aHcm
 TBIKNgLotg+Uu1OoB2vQpikTN0zNVUuo3z7a819tyX0uLjy2sEhYN9SonOlqkB6sNQxg
 SGHA==
Subject: Re: [Question] different kinds of memory barrier
References: <881f369d-4e5b-a335-6359-c5d7bf1bc086@gmail.com>
 <20170213190600.GJ30506@linux.vnet.ibm.com>
 <79ac9a88-3f3a-5b97-940f-35210a7d9405@gmail.com>
 <20170216185845.GJ30506@linux.vnet.ibm.com>
 <70c1256d-1045-f4df-3423-b326b28ff86d@gmail.com>
From: Yubin Ruan <ablacktshirt@gmail.com>
Message-ID: <04e7f34d-4e18-701d-80db-5a57a6e9718b@gmail.com>
Date: Fri, 17 Feb 2017 17:20:30 +0800
MIME-Version: 1.0
In-Reply-To: <70c1256d-1045-f4df-3423-b326b28ff86d@gmail.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>



On 2017年02月17日 16:45, Yubin Ruan wrote:
>
>
> On 2017年02月17日 02:58, Paul E. McKenney wrote:
>> On Tue, Feb 14, 2017 at 06:35:05PM +0800, Yubin Ruan wrote:
>>> On 2017/2/14 3:06, Paul E. McKenney wrote:
>>>> On Mon, Feb 13, 2017 at 09:55:50PM +0800, Yubin Ruan wrote:
>>>>> It have been mentioned in the book that there are three kinds of
>>>>> memory barriers: smp_rmb, smp_wmb, smp_mb
>>>>>
>>>>> I am confused about their actual semantic:
>>>>>
>>>>> The book says that(B.5 paragraph 2, perfbook2017.01.02a):
>>>>>
>>>>> for smp_rmb():
>>>>>    "The effect of this is that a read memory barrier orders
>>>>>     only loads on the CPU that executes it, so that all loads
>>>>>     preceding the read memory barrier will appear to have
>>>>>     completed before any load following the read memory
>>>>>     barrier"
>>>>>
>>>>> for smp_wmb():
>>>>>    "so that all stores preceding the write memory barrier will
>>>>>     appear to have completed before any store following the
>>>>>     write memory barrier"
>>>>>
>>>>> I wonder, is there any primitive "X" which can guarantees:
>>>>>    "that all 'loads' preceding the X will appear to have completed
>>>>>     before any *store* following the X "
>>>>>
>>>>> and similarly:
>>>>>    "that all 'store' preceding the X will appear to have completed
>>>>>     before any *load* following the X "
>>>
>>> I am reading your the material you provided.
>>> So, there is no short answer(yes/no) to the questions above?(I mean
>>> the primitive X)
>>
>> For smp_mb(), the full memory barrier, things are pretty simple.
>> All CPUs will agree that all accesses by any CPU preceding a given
>> smp_mb() happened before any accesses by that same CPU following that
>> same smp_mb().  Full memory barriers are also transitive, so that you
>> can reason (relatively) easily about situations involving many CPUs.
>>

One more thing about the full memory barrier. You say *all CPU agree*. 
It does not include Alpha, right?

regards,
Yubin Ruan

>> For smp_rmb() and smp_wmb(), not so much.  The canonical example showing
>> the complexity of smp_wmb() is called "R":
>>
>>     Thread 0        Thread 1
>>     --------        --------
>>     WRITE_ONCE(x, 1);    WRITE_ONCE(y, 2);
>>     smp_wmb();        smp_mb();
>>     WRITE_ONCE(y, 1);    r1 = READ_ONCE(x);
>>
>> One might hope that if the final value of y is 2, then the value of
>> r1 must be 1.  People hoping this would be disappointed, because
>> there really is hardware that will allow the outcome y == 1 && r1 == 0.
>>
>> See the following URL for many more examples of this sort of thing:
>>
>>     https://www.cl.cam.ac.uk/~pes20/ppc-supplemental/test6.pdf
>>
>> For more information, including some explanation of the nomenclature,
>> see:
>>
>>     https://www.cl.cam.ac.uk/~pes20/ppc-supplemental/test7.pdf
>>
>> There are formal memory models that account for this, and in fact this
>> appendix is slated to be rewritten based on some work a group of us have
>> been doing over the past two years or so.  A tarball containing a draft
>> of this work is attached.  I suggested starting with index.html.  If
>> you get a chance to look it over, I would value any suggestions that
>> you might have.
>>
>
> Thanks for your reply. I will take some time to read those materials.
> Discussions with you really help eliminate some of my doubts. Hopefully
> we can have more discussions in the future.
>
> regards,
> Yubin Ruan
>
>>>>> I know I can use the general smp_mb() for that, but that is a little
>>>>> too general.
>>>>>
>>>>> Do I miss/mix anything ?
>>>>
>>>> Well, the memory-ordering material is a bit dated.  There is some work
>>>> underway to come up with a better model, and I presented on it a couple
>>>> weeks ago:
>>>>
>>>> http://www.rdrop.com/users/paulmck/scalability/paper/LinuxMM.2017.01.19a.LCA.pdf
>>>>
>>>>
>>>> This presentation calls out a tarball that includes some .html files
>>>> that have much better explanations, and this wording will hopefully
>>>> be reflected in an upcoming version of the book.  Here is a direct
>>>> URL for the tarball:
>>>>
>>>> http://www.rdrop.com/users/paulmck/scalability/paper/LCA-LinuxMemoryModel.2017.01.15a.tgz
>>>>
>>>>
>>>>                             Thanx, Paul
>>>>
>>>
>>> regrads,
>>> Yubin Ruan
>>>

