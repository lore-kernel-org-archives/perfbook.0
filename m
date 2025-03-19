Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A675E1A7046
	for <perfbook@vger.kernel.org>; Wed, 19 Mar 2025 14:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742392909; cv=none; b=J+r3ZCugfwLzsN1Jf75SMlLT74oTwdZBTa/ps5hgwyP0PUzb5XxguanaxEmgSV2rRLEDxtpONFfTpOFVRrHo8UJbE0iwTM55+MAHJb+rEb0ZBjDrPx7Y6IPHPMsvLcxE2BKWWiMLkEIu9iYKxF8U3fuBGLczvNqeHGBsT1FBeHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742392909; c=relaxed/simple;
	bh=XhPZgOlmgkd+2rYG+dGctPIFF0YdRQAmP344RAXVWYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uy9wUJIIT9IpoE2Jb+d7IS+qVfrVGS1TaGl0W88GMiIU44L21DCz3n2n/lBqIAGiRGASayQeAxHeqwLw7hHAcgODNCkTs4X+i/5C4KYZgT1g2qqawDYpfMLvAgzDPwFaChMT1PmOZVA1ntHFh+Q6qLlGpjk0uP6sV6i2CK3rrPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iencinas.com; spf=pass smtp.mailfrom=iencinas.com; dkim=pass (2048-bit key) header.d=iencinas.com header.i=@iencinas.com header.b=a2TcitZg; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iencinas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iencinas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iencinas.com header.i=@iencinas.com header.b="a2TcitZg"
Message-ID: <65cb125e-fadb-4370-a379-4fd3b5303eb4@iencinas.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1742392904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bxY4qAwUA79yzuIDjN7j10RsLXbTWKb26JEcodLCFhk=;
	b=a2TcitZgMorcKpj6zXQqZIleSY2pybfWDhMWXDybN60bAR5ksDBx6ujDHgc8vIB+Dx0PVQ
	hwJfolbgmGZaAXaWcedeQQiO/E40CnQRVyiftTt7f3u9+BF9RPXpo+UhQvq3jCXfIEKJiR
	C+iky8uwoI9xD27seEakETjKET+pLHDOZWIxbdzB+0FiEFYMpJwHf/1aYuaCWpdibIAWUH
	DxFroPOsRhDD81rjvyPCWrimsSMYK/WMgrzKPfAHX2Qs/kB4nkC3Wnu4Ma/2yeDU7cW4o+
	NConTg2RQyssbZ+XbzNPgzQnhb5GSTWdvwPHbNN4NYmxAb3ksqL6CdxrfwnvLg==
Date: Wed, 19 Mar 2025 15:01:37 +0100
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH perfbook v3] bib/hw.bib: Update URL info of Alpha related
 entries
To: Akira Yokosawa <akiyks@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
References: <94203aeb-c930-4589-8244-9adfb01413a8@gmail.com>
 <ac4ab90c-8eba-4337-ab89-2364af30a6b9@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ignacio Encinas Rubio <ignacio@iencinas.com>
In-Reply-To: <ac4ab90c-8eba-4337-ab89-2364af30a6b9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 19/3/25 10:35, Akira Yokosawa wrote:
> Report from Ignacio in [1]:
> 
>   [Gha95] perfbook's link is down, it is also available here:
>   https://github.com/kaitoukito/Computer-Science-Textbooks/blob/master/Memory-Consistency-Models-for-Shared-Memory-Multiprocessors.pdf
> 
> Instead of random github repo without any LICENSE info, use a download
> link at http://i.stanford.edu/.
> 

Thank you for taking care of this! Not sure if any "tag" (as in
Reviewed-by, ...) is applicable, feel free to add any on my behalf :)
