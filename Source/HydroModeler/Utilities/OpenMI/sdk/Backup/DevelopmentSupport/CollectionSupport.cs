#region Copyright
/*
* Copyright (c) 2005,2006,2007, OpenMI Association
* All rights reserved.
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions are met:
*     * Redistributions of source code must retain the above copyright
*       notice, this list of conditions and the following disclaimer.
*     * Redistributions in binary form must reproduce the above copyright
*       notice, this list of conditions and the following disclaimer in the
*       documentation and/or other materials provided with the distribution.
*     * Neither the name of the OpenMI Association nor the
*       names of its contributors may be used to endorse or promote products
*       derived from this software without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY "OpenMI Association" ``AS IS'' AND ANY
* EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
* DISCLAIMED. IN NO EVENT SHALL "OpenMI Association" BE LIABLE FOR ANY
* DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
* (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
* LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
* ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
* SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
#endregion 

using System;
using System.Collections;

namespace Oatc.OpenMI.Sdk.DevelopmentSupport
{
	/// <summary>
	/// Support class for collections
	/// </summary>
	public class CollectionSupport
	{
		/// <summary>
		/// Indicates whether an object is contained by a collection by comparing references.
		/// The Equals method is not used, in contrary with the Contains method in the ArrayList.
		/// </summary>
		/// <param name="collection">The collection</param>
		/// <param name="target">The object which might be in the collection</param>
		/// <returns></returns>
		public static bool ContainsObject (ICollection collection, object target) 
		{
			foreach (object item in collection) 
			{
				if (item == target) 
				{
					return true;
				}
			}
			return false;
		}

		/// <summary>
		/// Converts a collection to an array
		/// </summary>
		/// <param name="list">The collection</param>
		/// <returns>The array</returns>
		public static object[] ToArray(IList list) 
		{
			object[] objects = new object[list.Count];
			for (int i = 0; i < list.Count; i++) 
			{
				objects[i] = list[i];
			}

			return objects;
		}
	}
}
